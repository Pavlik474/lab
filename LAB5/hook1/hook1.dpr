library hook1;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
Windows, Messages;

var
HookHandle: HHook = 0;
Wnd: HWND;
{$R *.res}

function HookProc(Code: Integer; wParam: Word; lParam: Longint): longint; stdcall;
begin
CallNextHookEx(HookHandle, Code, wParam, lParam);
if Code=HC_ACTION then begin
  if (TMsg(Pointer(lParam)^).message=WM_LBUTTONDOWN) 
       and ((TMsg(Pointer(lParam)^).wParam and MK_SHIFT)=MK_SHIFT) then begin
    Wnd:=TMsg(Pointer(lParam)^).hwnd;
    SendMessage(Wnd, EM_SETPASSWORDCHAR, 0, 0);
    InvalidateRect(Wnd, nil, true);
    end;
  end;
end;

procedure SetHook(State: Boolean) export; stdcall;
begin
if State then
  if HookHandle=0 then
     HookHandle:=SetWindowsHookEx(WH_GETMESSAGE, @HookProc, HInstance, 0)
else begin
  UnhookWindowsHookEx(HookHandle);
  HookHandle:=0;
  end;
end; 

exports SetHook index 1;

begin

end.

