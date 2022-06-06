program P_Pilha;

uses
  Forms,
  U_Pilha in 'U_Pilha.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
