from decimal import Decimal

class Datadiffusion:
    def __init__(self,text):
        self.text = text
        self.alphabet = []
        for i in text:
            if i not in self.alphabet:
                self.alphabet.append(i)
                
    def change_alphabet(self,newcharacters):
        for i in newcharacters:
            if i not in self.alphabet:
                self.alphabet.append(i)
        self.frequency_analysis() #recalculates
                
    def delete_characters(self,characters_to_delete):
        for i in characters_to_delete:
            if i in self.alphabet:
                del(self.alphabet[self.alphabet.index(i)])
                
    def change_text(self,text):
        self.text = text
        self.alphabet = []
        for i in text:
            if i not in self.alphabet:
                self.alphabet.append(i)
        self.frequency_analysis()
                
    def frequency_analysis(self):
        self.values = [0]*len(self.alphabet)
        for i in self.text:
            self.values[self.alphabet.index(i)]+=1
            
    def run_test(self):
        try:
            self.values.sort()
            result = 0
            length = len(self.values)
            for i in xrange(length//2):
                result += self.values[length-1 -i] - self.values[i]
            length = len(self.text)
            result = result/float(length)
            return 1 - result
        except AttributeError:
            self.frequency_analysis()
            return self.run_test()

class Tools: #Arrays for lookups
    lowercase = ('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z')
    uppercase = ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
    def char_to_int(self,char): #Character => integer
        try:
            return self.uppercase.index(char)
            
        except ValueError:
            try:
                return self.lowercase.index(char)
                
            except ValueError:
                print "Failure"
                return -1            
    
    def int_to_char(self,integer): #Integer => character
        return self.uppercase[integer]
    
    def preprocess(self,string): #Removes spaces, punctuation etc
        result = []
        for i in range(len(string)):
            if string[i] in self.uppercase + self.lowercase:
                try: lookup = self.uppercase.index(string[i])
                except ValueError:
                    lookup = self.lowercase.index(string[i])
                result.append(self.uppercase[lookup])
        return result

text = '''
GRLZEHNRAOTNNPMPVKUGUFLIGYBRPNOSTUHKMGLTTUBRSYUGGNOAFXDALVEIEQGRNUGRLOLNGALUMHGRLHLIMAZGBAAYEIMPGRLDKELRTQNPRNZHGATULGHMEUPLUQRATPLPKITYGRHBGYUNMPPMERTYIOUGANALMPBVTADAEIGDUZARKTPOAOLTUFKZRLUGEPPLADTFADKEBLUGRAVDPLHKMGRLRAEPRDKEUIXLPMFADGKHIOTQOAEPUHMHAPKGGTRUTAHZFYBNEPGRUGNACXOUTUMRGYGRNIIEAMPLHLINVBAOPMMYOKTGYGGTREAYGTYDGAAMAYGYBRSYUGGNADKEBLUGRAGRELUGATBPTYKOHGUHTAHZFYBNRPTYMAUMNLPNNLKOOKTGYGGTUGOAYGGTZCGTNPVDXMKODEEXAKQFIZRARLKOTAHZFYBNLPBVDASNGTPNMGRMARKGATRATHBNEPAORLUNBRKENPIZRAUNUGRLRDEREHRAMVKOLYFBEINGHMADARVDALUGRARDSVTADATUUOBAAGLYGTOIAREDPNIOUFPVGAQYLYGTNGAOEIEQGRHBGYUNBLNKEXEICDAGRENAYAUGEPTAHZFYBNLINBGUBRYATUMRGTUGATBPTYKOHCDBMCHUNSGRNKMGHZTUADPNIOEPUGANAOIEIPAMYEUNUAKRQHRDIELRSPEPREKMGTLTQXGRUGRAUGGEYDARTOBIERUHTOVKFLAMTNUNUAKRQHRDFWGDQUBIERHMEHRANAPLSYUGEPTUEBANTPOMOIYKEPDEGTSEKMLTDALPMPADARTAHOBVTLYAOKOGRABLNKEXNPTLLNTQMUPMFAGYBRSYUGLGLIMAVNTYGTLREQUOMREQGRNIIEAMPLTOPNRMTGMHUGLNBRLKLPYGARLWLDAPKGMPYGFBOKSPDYREEROITHGUUHATHURQGDUGATBPTYKOHCPUUGEPTAHZFYBNLPVBPNGTGDZKARUGKOUGRGBVTVARTPESVDTUBRSYUGATBPTYKOCYLPARUPEORLUNHLEIGDEIAKTMKZKOUZAUMUTLXLPMIOKVMAEAGYZHTYIUDAMPUNHKUHAKIEYGUGRDGQPANPNAUMHMZHDAYGVSRAUTKOARQFPOTNUGGNAREPZKDOXMUHUGLGEPGRAEEILKXENAPUGTEIUTVKFLDFIOPNOTGYKHINIAGTKBLGUHUGDYARQGGRECOAAFPUOBMREKUOIUGYBRUTGRVKFLAFLGUZKEUGRGUZTLKONITYILEUARBRPFLYGTUGUHUZHBEXTLDAFBRLEIEQGRILYGAODEPLKEZKDOUMBLEUUGRARGBAAGLYGTBDPERMHTRLEIAQLPTLEQMZUZLZARTUUHEPKITYRDNSGROUPTANUTREGBLPARUPEORLUNNPULMRRDPLTUEBKOBTMUSGUHUEMZIUPMTYADMTNPUGRLMPHKYAEZMHNIARMHPLADQXUHQKIOGDDERLGABOKEVBTGFXKOUGGNIORKAMRAUFINAGAOTNPLBRSVTVHKKGRSPMIOUNEINUGRAUDAUNHMZHGTSPOANAUFRAHMEHRANAPLARUESREGWSPOPMYGEIRKZHLYTAEUQXUZELGABRALUALTTLEQKRGYDGSYUGLGADQRMBYDAKEKNUDEARDLWNOIYQBRSYUGMPVDTUGRZKDOMHUGGNGRSYUNBLNKEXVKUGZNZHTALOMPPMIOKVUZELAMNDUNUALTGTUNTGMHUGLTDYUHMQUNZNPRKEEINUGREUNUGRHSOHRALPLIDAMIMSEGTULYLNEILKENADPNUPLRHMEZUZLUPQUIEUKOUZDZUHOCANRFNPERLZ
'''
Tools = Tools()
text = Tools.preprocess(text)
Diffusion = Datadiffusion(text)
Diffusion.change_alphabet(('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'))
print Diffusion.run_test()
