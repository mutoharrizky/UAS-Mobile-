unit REST;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp, Data.DB, MemDS, DBAccess, Uni,
  UniProvider, MySQLUniProvider;

type
  TWebModule1 = class(TWebModule)
    UniConnection1: TUniConnection;
    MySQLUniProvider1: TMySQLUniProvider;
    spex: TUniStoredProc;
    qex: TUniQuery;
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1viewAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TWebModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TWebModule1.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content :=
    '<html>' +
    '<head><title>REST API</title></head>' +
    '<body>Web Server Application with REST</body>' +
    '</html>';
end;

procedure TWebModule1.WebModule1viewAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  with qex do
  begin
    SQL.Clear;
    SQL.Text := 'SELECT fc_json_user() as data_user;';
    Execute;
    Response.ContentType := 'application/json; charset=utf-8';
    Response.Content     := Fields.Fields[0].AsString;
  end;
end;

end.
