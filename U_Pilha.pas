unit U_Pilha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    pilha: array [0..4] of string;
    procedure atualizaMemo;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.atualizaMemo;
var i: integer;
begin
  Memo1.Clear;
  for i := 0 to 4 do
      begin
        Memo1.Lines.Add(pilha[i]);
      end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var i: integer;
begin
  if Edit1.Text = EmptyStr then
     begin
       ShowMessage('Informe algo para inserir na pilha');
       exit;
     end;
  if pilha[4] <> EmptyStr then
     ShowMessage ('Pilha cheia');
  for i := 0 to 4 do
     begin
       if pilha[i] = EmptyStr then
          begin
            pilha[i] := Edit1.Text;
            break;
          end;
     end;

  Edit1.Text := EmptyStr;
  atualizaMemo;
end;

procedure TForm1.Button2Click(Sender: TObject);
var i: integer;
begin
  if pilha[0] = EmptyStr then
    ShowMessage ('Pilha vazia')
  else
  begin
    for i := 4 downto 0 do
    begin
      if pilha[i] <> EmptyStr then
         begin
           ShowMessage('Tirando ' + pilha[i] + ' da pilha');
           pilha[i] := EmptyStr;
           break;
         end;
         
    end;
    atualizaMemo;
  end;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
     begin
       Button1Click(Sender);
     end;
end;

end.
