$319 $62C !	( poke USB address )
: ustat $319 in hex. ;
: u. $319 inw hex. ;
: u? begin u. 100 ms getKey until ;
: >u ustat $319 out ustat ;

: ... 0 do $72 USBPut drop 20 ms loop waitKey drop ;

: log 
	if
		0 " USB.LOG" ds> >es fcreate USBLogHandle !
	else
		USBLogHandle @ fclose hex. 0 USBLogHandle !
	endif
;

1 log
( HostControl @ COMMS_OUT_ON or HostControl ! )

: # 0 do info loop ;

: s SyringeRezero ;

: usbcount $319 ind dword. ;
: ?? cls begin 0 10 at usbcount 1000 ms getKey until cr ;
