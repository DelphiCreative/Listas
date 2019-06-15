unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  System.Generics.Collections,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FMX.Effects, FMX.Objects, FMX.ListBox, FMX.Edit,
  System.ImageList, FMX.ImgList, FireDAC.Stan.StorageJSON;


type
  TfMain = class(TForm)
    VertScrollBox1: TVertScrollBox;
    Rectangle1: TRectangle;
    ShadowEffect1: TShadowEffect;
    Rectangle2: TRectangle;
    Label1: TLabel;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    Rectangle7: TRectangle;
    Icones: TImageList;
    tabCadastro: TFDMemTable;
    tabCadastroCodigo: TAutoIncField;
    tabCadastroNome: TStringField;
    tabCadastroRua: TStringField;
    tabCadastroBairro: TStringField;
    tabCadastroCidade: TStringField;
    tabCadastroAtivo: TBooleanField;
    Rectangle8: TRectangle;
    tabCadastroDataCadastro: TDateField;
    Rectangle9: TRectangle;
    Label2: TLabel;
    Label3: TLabel;
    edtNome: TEdit;
    Label4: TLabel;
    edtCodigo: TEdit;
    Label5: TLabel;
    edtEndereco: TEdit;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    ckbAtivo: TCheckBox;
    procedure Rectangle5Click(Sender: TObject);
    procedure Rectangle4Click(Sender: TObject);
    procedure Rectangle3Click(Sender: TObject);
    procedure Rectangle6Click(Sender: TObject);
    procedure Rectangle7Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListaCadastro;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

{$R *.fmx}

uses uLayouts.Utils;

procedure TfMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabCadastro.SaveToFile(GetCurrentDir+'\cadastro.json');
end;

procedure TfMain.FormCreate(Sender: TObject);
begin
   if FileExists(GetCurrentDir+'\cadastro.json') then
      tabCadastro.LoadFromFile(GetCurrentDir+'\cadastro.json')
   else
      tabCadastro.Open;
   ListaCadastro;
end;

procedure TfMain.Label2Click(Sender: TObject);
begin
   if tabCadastro.Locate('Codigo',edtCodigo.Text,[]) then
      tabCadastro.Edit
   else begin
      tabCadastro.Append;
      tabCadastroCodigo.AsString := edtCodigo.Text;
      tabCadastroDataCadastro.AsDateTime := Date;
   end;
   tabCadastroAtivo.AsBoolean := ckbAtivo.IsChecked;
   tabCadastroNome.AsString := edtNome.Text;
   tabCadastroRua.AsString := edtEndereco.Text;
   tabCadastro.Post;
   ListaCadastro;
end;

procedure TfMain.ListaCadastro;
begin
   VertScrollBox1.ClearAllObjects;
   tabCadastro.First;
   while not tabCadastro.Eof do begin
      VertScrollBox1.SkypeCard(tabCadastroNome.AsString,
                               tabCadastroRua.AsString,
                               tabCadastroDataCadastro.AsDateTime,
                               tabCadastroCodigo.AsInteger,
                               tabCadastroAtivo.AsBoolean);
      tabCadastro.Next;
   end;

end;

procedure TfMain.Rectangle3Click(Sender: TObject);
begin
   VertScrollBox1.GoogleCard('DELPHI CREATIVE - DASHBOARDS SEM COMPONENTES',
                             '8 de dez de 2018 - Vídeo enviado por Delphi Creative '+
                             'O GRÁFICO CIRCULAR - Gráfico tipo Pizza ou tipo Donuts? Tanto faz... Se inscreve no canal e ...',
                               'https://www.youtube.com/watch?v=CEKiEbw4vMo'
                             );
end;

procedure TfMain.Rectangle4Click(Sender: TObject);
begin
//   VertScrollBox1.SkypeCard('Diego Cataneo','Online à 10 minutos',  Date,  10,1 );
//   VertScrollBox1.SkypeCard('Diego Cataneo','Offline', Date, 7,0 );
end;

procedure TfMain.Rectangle5Click(Sender: TObject);
begin
   VertScrollBox1.StringCard('Diego Cataneo;Delphi Creative;Se inscreva no canal;diegocataneo@outlook.com');
end;

procedure TfMain.Rectangle6Click(Sender: TObject);
begin
   VertScrollBox1.ClearAllObjects;
end;

procedure TfMain.Rectangle7Click(Sender: TObject);
begin
   Showmessage('Nó proximo vídeo vamos criar uma lista semelhante a do YouTube')
end;

initialization
   ReportMemoryLeaksOnShutdown := True;

end.
