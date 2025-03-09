unit Unit1;

interface

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids, ExtCtrls,
  fphttpclient, jsonparser, fpjson, opensslsockets,
  pfapi.client, pfapi.dto,
  mormot.core.variants, mormot.core.json, mormot.net.client, mormot.core.buffers;

type
  TForm1 = class(TForm)
    lblLogin: TLabel;
    lblPassword: TLabel;
    edtLogin: TEdit;
    edtPassword: TEdit;
    btnLoadRules: TButton;
    sgRules: TStringGrid;
    Memo1: TMemo;
    Edit2: TEdit;
    procedure btnLoadRulesClick(Sender: TObject);
    procedure sgRulesSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    PfApiClient: TPfApiClient;
    AccessToken: string;
    procedure LoadRulesFromAPI;
    procedure PopulateGrid(const Rules: array of TFirewallRule);
    procedure GetRuleSchedule(const Rule: TFirewallRule);
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  HttpClient: IJsonClient;
begin
  HttpClient := TJsonClient.Create('https://your-pfsense-server/api/v2');
  HttpClient.Options := [jcoParseTolerant, jcoHttpErrorRaise];
  HttpClient.UrlEncoder := [ueEncodeNames, ueSkipVoidString, ueSkipVoidValue, ueStarNameIsCsv];
  PfApiClient := TPfApiClient.Create(HttpClient);
end;

procedure TForm1.LoadRulesFromAPI;
var
  AuthResponse, RulesResponse: variant;
  AuthPayload: variant;
  Rules: array of TFirewallRule;
  I: Integer;
begin
  try
    if (edtLogin.Text = '') or (edtPassword.Text = '') then
    begin
      ShowMessage('Введите логин и пароль!');
      Exit;
    end;

    // Авторизация через JWT
    AuthPayload := TDocVariant.New;
    AuthPayload.StrToUtf8['username'] := edtLogin.Text;
    AuthPayload.StrToUtf8['password'] := edtPassword.Text;

    AuthResponse := PfApiClient.PostAuthJWTEndpoint(AuthPayload);
    if (AuthResponse.VariableName['code'].AsInteger =200)
      then
      AccessToken := AuthResponse.VariableName['access_token'].AsString
    else
    begin
      ShowMessage('Ошибка:функции LoadRulesFromAPI');
      Exit;
    end;

    // Загрузка правил
    RulesResponse := PfApiClient.GetFirewallRulesEndpoint(
      TDocVariant.New, // Query
      0,               // Limit: integer
      0,               // Offset: integer
      nil,             // SortBy
      epa63None,       // SortOrder
      epa64None        // SortFlags
    );

    if not VarIsEmpty(RulesResponse) and (RulesResponse['code'].AsInteger = 200) then
    begin
      var DataArray := RulesResponse['data'];
      if DataArray.IsArray then
      begin
        SetLength(Rules, DataArray.Count);
        for I := 0 to High(Rules) do
        begin
          var jsonRule := TDocVariant(DataArray[I]);
          with Rules[I] do
          begin
            Ackqueue := jsonRule['ackqueue'];
            AssociatedRuleId := jsonRule['associated_rule_id'];
            CreatedBy := jsonRule['created_by'];
            CreatedTime := jsonRule['created_time'];
            Defaultqueue := jsonRule['defaultqueue'];
            Descr := jsonRule['descr'];
            Destination := jsonRule['destination'];
            DestinationPort := jsonRule['destination_port'];
            Direction := TEnumPfApi11(jsonRule['direction'].AsInteger);
            Disabled := jsonRule['disabled'];
            Dnpipe := jsonRule['dnpipe'];
            Floating := jsonRule['floating'];
            Gateway := jsonRule['gateway'];
            Icmptype := TEnumPfApi12Set(jsonRule['icmptype'].AsInteger);
            _Interface := jsonRule['interface'].AsRawUtf8DynArray;
            Ipprotocol := TEnumPfApi13(jsonRule['ipprotocol'].AsInteger);
            Log := jsonRule['log'];
            Pdnpipe := jsonRule['pdnpipe'];
            Protocol := TEnumPfApi14(jsonRule['protocol'].AsInteger);
            Quick := jsonRule['quick'];
            Sched := jsonRule['sched'];
            Source := jsonRule['source'];
            SourcePort := jsonRule['source_port'];
            Statetype := TEnumPfApi15(jsonRule['statetype'].AsInteger);
            Tag := jsonRule['tag'];
            TcpFlagsAny := jsonRule['tcp_flags_any'];
            TcpFlagsOutOf := TEnumPfApi16Set(jsonRule['tcp_flags_out_of'].AsInteger);
            TcpFlagsSet := TEnumPfApi16Set(jsonRule['tcp_flags_set'].AsInteger);
            Tracker := jsonRule['tracker'].AsInteger;
            _Type := TEnumPfApi17(jsonRule['_type'].AsInteger);
            UpdatedBy := jsonRule['updated_by'];
            UpdatedTime := jsonRule['updated_time'];
          end;
        end;
        PopulateGrid(Rules);
      end
      else
        ShowMessage('Ошибка: Некорректный ответ API');
    end
    else
      ShowMessage('Ошибка: ' + RulesResponse['message']);
  except
    on E: Exception do
    begin
      Memo1.Lines.Add(E.Message);
      ShowMessage('Ошибка: ' + E.Message);
    end;
  end;
end;

procedure TForm1.PopulateGrid(const Rules: array of TFirewallRule);
var
  I: Integer;
begin
  sgRules.RowCount := 1;
  sgRules.Cells[0, 0] := 'ID';
  sgRules.Cells[1, 0] := 'Тип';
  sgRules.Cells[2, 0] := 'Интерфейс';
  sgRules.Cells[3, 0] := 'Описание';

  for I := 0 to High(Rules) do
  begin
    sgRules.RowCount := sgRules.RowCount + 1;
    with Rules[I] do
    begin
      sgRules.Cells[0, I + 1] := IntToStr(Tracker);
      sgRules.Cells[1, I + 1] := ENUMPFAPI17_TXT[_Type]; // Используем предоставленный массив
      sgRules.Cells[2, I + 1] := _Interface[0]; // Первый интерфейс из массива
      sgRules.Cells[3, I + 1] := Descr;
    end;
  end;
end;

procedure TForm1.btnLoadRulesClick(Sender: TObject);
begin
  LoadRulesFromAPI;
end;




procedure TForm1.sgRulesSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
var
  RuleID: Integer;
  Rule: TFirewallRule;
begin
  if ARow = 0 then Exit;

  RuleID := StrToInt(sgRules.Cells[0, ARow]);

  // Получаем детали правила
  var RuleResponse := PfApiClient.GetFirewallRuleEndpoint(RuleID);
  if VarIsArray(RuleResponse) then
  begin
    Rule := TFirewallRule(GetArrayElement(RuleResponse, 0));
    GetRuleSchedule(Rule);
  end;
end;

procedure TForm1.GetRuleSchedule(const Rule: TFirewallRule);
begin
  if Rule.Sched <> '' then
    Edit2.Text := Rule.Sched
  else
    Edit2.Text := 'Нет расписания';
end;

end.
