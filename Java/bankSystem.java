// This file contains the code to define a remote bank system
// It is rather fleshed out pseudo code (IE I've assumed the existence of a few classes and methods)

interface RemoteBankSystem extends Remote { // Remote interface for the bank system
    ReturnValue remoteTransaction(Transaction t) throws RemoteException;
    static BankSystem getBankSystem() throws RemoteException;
}

final class BankSystem implements RemoteBankSystem{ // Server object
	private Map<ID,BankAccount> mAccounts; // Hypothetical map class
	private static BankSystem singleton;

	private BankSystem(){ // construct the banksystem
		mAccounts = new Map<ID,BankAccount>();
	}

	public static BankSystem getBankSystem() throws RemoteException { // singleton construct
		if (singleton == null) singleton = new BankSystem();
		return singleton;
	}

	public ReturnValue remoteTransaction(Transaction t) throws RemoteException{ // handle a transaction
		if (WithdrawTransaction.isinstance(t)) {
			return new ReturnValue(null, 0, mAccounts.lookup(t.getAccountId()).widthdraw(t.getKey(), t.getAmount()));
		} else if (DepositTransaction.isinstance(t)) {
			return new ReturnValue(null, 0, mAccounts.lookup(t.getAccountId()).deposit(t.getAmount()));
		} else if (BalanceTransaction.isinstance(t)) {
			return new ReturnValue(null, mAccounts.lookup(t.getAccountId()).getBalance(t.getKey()),true)
		} else if (CreateTransaction.isinstance(t)) {
			ID private = new ID(); // realistically, these two would be related mathematically
			ID public = new ID();
			return new ReturnValue()
		} else if (TransferTransaction.isinstance(t)){ // handle a transfer
			TransferTransaction new_t = (TransferTransaction) t;
			ID a; ID b;
			int comparisonValue = new_t.getSource().compareTo(new_t.getDest());
			if ( comparisonValue < 0){ // enforce a preorder on locking and use 2PL to ensure no deadlocks
				a = new_t.getSource();
				b = new_t.getDest();
			} else if (comparisonValue > 0) {
				a = new_t.getDest();
				b = new_t.getSource();
			} else {
				a = new_t.getSource(); // source == dest
				b = null;
			}

			takeLock(a);
			takeLock(b);
			ReturnValue r =  new ReturnValue(
					null, 0, mAccounts.lookup(new_t.getSource()).widthdraw(new_t.getKey(), new_t.getAmount()) &&
							 mAccounts.lookup(new_t.getDest()).deposit(new_t.getAmount())
			 );
			release(a);
			release(b);

			return r;
		}
	}

 	public static void main(String args[]) {  // set up remote registry
        try {
            Server obj = new RemoteBankSystem();
           	BankSystem stub = (BankSystem) UnicastRemoteObject.exportObject(obj, 0);

            // Bind the remote object's stub in the registry
            Registry registry = LocateRegistry.getRegistry();
            registry.bind("BankSystem", stub);

        } catch (Exception e) {
            System.err.println("Server exception: " + e.toString());
            e.printStackTrace();
        }
    }

}

class BankAccount { // Bank account class executes transactions
	private ID mPublic;
	private ID mPrivate;
	private int mBalance;

	public BankAccount(ID public, ID private, int balance){
		mPublic = public;
		mPrivate = private;
		mBalance = balance;

	}

	public synchronized boolean widthdraw(Key k, int amount){
		if (validate(k, mPrivate)){
			if (mBalance >= amount) {
				mBalance -= amount;
				return true;
			} else return false;
		} else return false;
	}

	public synchronized boolean deposit(int amount){
		// no requirement for private key, so anyone can deposit
		mBalance += amount;
		return true; // could be more complex/have more checks
	}

	public synchronized int getBalance(Key k){
		if (validate(k), mPrivate) return mBalance;
		return 0;
	}
}

class ReturnValue implements Serializable { // return value class that is serializable to be transmitted
	private Key privateKey;
	private int amt;
	private boolean success;

	public ReturnValue(Key private, int amount, boolean succ){
		privateKey = private;
		amt = amount;
		success =  succ;
	}

	/*
		Include getters but no setters


	*/
} 

abstract class Transaction implements Serializable { // this class defines transactions
	private Key key; // some object which is produced from client id/secrets to protect the transaction
	private int amount;
	private ID id;
	public Version v = 1.0.0.0;

	protected Transaction(ID account, ID clientID, int amt){
		key = Client.makeKey(clientID, account, amount);
		amount = amt;
		id = account;
	}

	public Key getKey(){return key;}
	public int getAmount(){return amount;}
	public ID getAccountId(){return id;}
}

class WithdrawTransaction extends Transaction implements Serializable { // these classes tag transactions for different purposes
	public WithdrawTransaction(ID account, ID clientID, int amt){
		super(account, clientID, amt);
	}
}

class DepositTransaction extends Transaction implements Serializable {
	public DepositTransaction(ID account, ID clientID, int amt){
		super(account, clientID, amt);
	}
}

class BalanceTransaction extends Transaction implements Serializable {
	public BalanceTransaction(ID account, ID clientID){
		super(account, clientID, 0);
	}
}

class CreateTransaction extends Transaction implements Serializable {
	public BalanceTransaction(ID account, ID clientID){
		super(account, clientID, 0);
	}
}

class TransferTransaction extends Transaction implements Serializable {
	private ID mDestAccount;
	public ID getSource(){ return super.getAccountId();)}
	public ID getDest(){ return mDestAccount;}

	public BalanceTransaction(ID sourceAccount, ID destAccount, int amount, ID clientID){
		super(sourceAccount, clientID, amt);
		mDestAccount = destAccount;
	}
}