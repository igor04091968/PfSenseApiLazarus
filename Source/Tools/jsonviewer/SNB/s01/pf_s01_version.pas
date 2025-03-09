unit pf_s01_version;

interface

uses SysUtils, Classes, fpJSON;


Type
  
  
  { -----------------------------------------------------------------------
    TdataPF
    -----------------------------------------------------------------------}
  
  TdataPF = class(TObject)
  Private
    Fversion : String;
    Fbase : TDateTime;
    Fpatch : TDateTime;
    Fbuildtime : String;
  Protected
    Procedure Setversion(AValue : String); virtual;
    Procedure Setbase(AValue : TDateTime); virtual;
    Procedure Setpatch(AValue : TDateTime); virtual;
    Procedure Setbuildtime(AValue : String); virtual;
  Public
    Constructor CreateFromJSON(AJSON : TJSONData); virtual;
    Procedure LoadFromJSON(AJSON : TJSONData); virtual;
    Function SaveToJSON : TJSONObject; overload;
    Procedure SaveToJSON(AJSON : TJSONObject); overload; virtual;
    Property version : String Read Fversion Write Setversion;
    Property base : TDateTime Read Fbase Write Setbase;
    Property patch : TDateTime Read Fpatch Write Setpatch;
    Property buildtime : String Read Fbuildtime Write Setbuildtime;
  end;
  
  
  { -----------------------------------------------------------------------
    TMyObject
    -----------------------------------------------------------------------}
  
  TMyObject = class(TObject)
  Private
    Fcode : Integer;
    Fstatus : String;
    Fresponse_id : String;
    Fmessage : String;
    Fdata : TdataPF;
  Protected
    Procedure Setcode(AValue : Integer); virtual;
    Procedure Setstatus(AValue : String); virtual;
    Procedure Setresponse_id(AValue : String); virtual;
    Procedure Setmessage(AValue : String); virtual;
    Procedure Setdata(AValue : TdataPF); virtual;
  Public
    Destructor Destroy; override;
    Constructor CreateFromJSON(AJSON : TJSONData); virtual;
    Procedure LoadFromJSON(AJSON : TJSONData); virtual;
    Function SaveToJSON : TJSONObject; overload;
    Procedure SaveToJSON(AJSON : TJSONObject); overload; virtual;
    Property code : Integer Read Fcode Write Setcode;
    Property status : String Read Fstatus Write Setstatus;
    Property response_id : String Read Fresponse_id Write Setresponse_id;
    Property message : String Read Fmessage Write Setmessage;
    Property data : TdataPF Read Fdata Write Setdata;
  end;

implementation




{ -----------------------------------------------------------------------
  TdataPF
  -----------------------------------------------------------------------}


Procedure TdataPF.Setversion(AValue : String);

begin
  if (Fversion=AValue) then exit;
  Fversion:=AValue;
end;

Procedure TdataPF.Setbase(AValue : TDateTime);

begin
  if (Fbase=AValue) then exit;
  Fbase:=AValue;
end;

Procedure TdataPF.Setpatch(AValue : TDateTime);

begin
  if (Fpatch=AValue) then exit;
  Fpatch:=AValue;
end;

Procedure TdataPF.Setbuildtime(AValue : String);

begin
  if (Fbuildtime=AValue) then exit;
  Fbuildtime:=AValue;
end;

Constructor TdataPF.CreateFromJSON(AJSON : TJSONData);

begin
  Create();
  LoadFromJSON(AJSON);
end;

Procedure TdataPF.LoadFromJSON(AJSON : TJSONData);

var
  E : TJSONEnum;

begin
  for E in AJSON do
    begin
    case E.Key of
    'version':
      version:=E.Value.AsString;
    'base':
      Raise EJSON.CreateFmt('"%s": Cannot handle property of type "%s"'),[ClassName,'TDateTime']);
    'patch':
      Raise EJSON.CreateFmt('"%s": Cannot handle property of type "%s"'),[ClassName,'TDateTime']);
    'buildtime':
      buildtime:=E.Value.AsString;
    end;
    end;
end;
Function  TdataPF.SaveToJSON : TJSONObject;
begin
  Result:=TJSONObject.Create;
  Try
    SaveToJSON(Result);
  except
    FreeAndNil(Result);
    Raise;
  end;
end;


Procedure TdataPF.SaveToJSON(AJSON : TJSONObject);

begin
  AJSON.Add('version',version);
  AJSON.Add('base',version);
  AJSON.Add('patch',version);
  AJSON.Add('buildtime',buildtime);
end;


{ -----------------------------------------------------------------------
  TMyObject
  -----------------------------------------------------------------------}

Destructor TMyObject.Destroy;

begin
  FreeAndNil(Fdata);
  inherited;
end;


Procedure TMyObject.Setcode(AValue : Integer);

begin
  if (Fcode=AValue) then exit;
  Fcode:=AValue;
end;

Procedure TMyObject.Setstatus(AValue : String);

begin
  if (Fstatus=AValue) then exit;
  Fstatus:=AValue;
end;

Procedure TMyObject.Setresponse_id(AValue : String);

begin
  if (Fresponse_id=AValue) then exit;
  Fresponse_id:=AValue;
end;

Procedure TMyObject.Setmessage(AValue : String);

begin
  if (Fmessage=AValue) then exit;
  Fmessage:=AValue;
end;

Procedure TMyObject.Setdata(AValue : TdataPF);

begin
  if (Fdata=AValue) then exit;
  FreeAndNil(Fdata);
  Fdata:=AValue;
end;

Constructor TMyObject.CreateFromJSON(AJSON : TJSONData);

begin
  Create();
  LoadFromJSON(AJSON);
end;

Procedure TMyObject.LoadFromJSON(AJSON : TJSONData);

var
  E : TJSONEnum;

begin
  for E in AJSON do
    begin
    case E.Key of
    'code':
      code:=E.Value.AsInteger;
    'status':
      status:=E.Value.AsString;
    'response_id':
      response_id:=E.Value.AsString;
    'message':
      message:=E.Value.AsString;
    'data':
      data:=TdataPF.CreateFromJSON(E.Value);
    end;
    end;
end;
Function  TMyObject.SaveToJSON : TJSONObject;
begin
  Result:=TJSONObject.Create;
  Try
    SaveToJSON(Result);
  except
    FreeAndNil(Result);
    Raise;
  end;
end;


Procedure TMyObject.SaveToJSON(AJSON : TJSONObject);

begin
  AJSON.Add('code',code);
  AJSON.Add('status',status);
  AJSON.Add('response_id',response_id);
  AJSON.Add('message',message);
  If Assigned(data) then
    AJSON.Add('data',data.SaveToJSON);
end;

end.
