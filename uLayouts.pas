unit uLayouts;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Effects;

type
  TfLayouts = class(TForm)
    retSkype: TRectangle;
    Circle1: TCircle;
    Layout1: TLayout;
    Circle2: TCircle;
    retGoogle: TRectangle;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Layout2: TLayout;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Layout3: TLayout;
    lblDataCadastro: TLabel;
    retAndroid: TRectangle;
    Circle4: TCircle;
    Label9: TLabel;
    Layout4: TLayout;
    ShadowEffect1: TShadowEffect;
    btnExcluir: TSpeedButton;
    procedure retSkypeClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fLayouts: TfLayouts;

implementation

{$R *.fmx}

uses uMain;

procedure TfLayouts.btnExcluirClick(Sender: TObject);
begin
   if fMain.tabCadastro.Locate('Codigo',Inttostr(TSpeedButton(Sender).Tag),[] ) then begin
      fMain.tabCadastro.Delete;
      fMain.ListaCadastro;
   end;

end;

procedure TfLayouts.retSkypeClick(Sender: TObject);
begin
   if fMain.tabCadastro.Locate('Codigo',Inttostr(TRectangle(Sender).Tag),[] ) then begin
      fMain.edtCodigo.Text := fMain.tabCadastroCodigo.AsString;
      fMain.edtNome.Text := fMain.tabCadastroNome.AsString;
      fMain.edtEndereco.Text := fMain.tabCadastroRua.AsString;
      fMain.ckbAtivo.IsChecked := fMain.tabCadastroAtivo.AsBoolean;
   end;
end;

end.
