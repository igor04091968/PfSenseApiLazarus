unit pf_add_rule;

interface

uses SysUtils, Classes, fpJSON;


Type
  
  TdataIteminterface = Array of String;

Function CreateTdataIteminterface(AJSON : TJSONData) : TdataIteminterface;
Procedure SaveTdataIteminterfaceToJSON(AnArray : TdataIteminterface; AJSONArray : TJSONArray); overload;
Function SaveTdataIteminterfaceToJSON(AnArray : TdataIteminterface) : TJSONArray; overload;


Type
  
  
  { -----------------------------------------------------------------------
    TdataItem
    -----------------------------------------------------------------------}
  
  TdataItem = class(TObject)
  Private
    F_type : String;
    F_interface : TdataIteminterface;
    Fipprotocol : String;
    Fprotocol : String;
    Fsource : String;
    Fsource_port : String;
    Fdestination : String;
    Fdestination_port : String;
    Fdescr : String;
    Fdisabled : Boolean;
    Flog : Boolean;
    Ftag : String;
    Fstatetype : String;
    Ftcp_flags_any : Boolean;
    Fsched : String;
    Ffloating : Boolean;
    Fquick : Boolean;
    Fdirection : String;
  Public
    Destructor Destroy; override;
    Constructor CreateFromJSON(AJSON : TJSONData); virtual;
    Procedure LoadFromJSON(AJSON : TJSONData); virtual;
    Function SaveToJSON : TJSONObject; overload;
    Procedure SaveToJSON(AJSON : TJSONObject); overload; virtual;
    Property _type : String Read F_type Write F_type;
    Property _interface : TdataIteminterface Read F_interface Write F_interface;
    Property ipprotocol : String Read Fipprotocol Write Fipprotocol;
    Property protocol : String Read Fprotocol Write Fprotocol;
    Property source : String Read Fsource Write Fsource;
    Property source_port : String Read Fsource_port Write Fsource_port;
    Property destination : String Read Fdestination Write Fdestination;
    Property destination_port : String Read Fdestination_port Write Fdestination_port;
    Property descr : String Read Fdescr Write Fdescr;
    Property disabled : Boolean Read Fdisabled Write Fdisabled;
    Property log : Boolean Read Flog Write Flog;
    Property tag : String Read Ftag Write Ftag;
    Property statetype : String Read Fstatetype Write Fstatetype;
    Property tcp_flags_any : Boolean Read Ftcp_flags_any Write Ftcp_flags_any;
    Property sched : String Read Fsched Write Fsched;
    Property floating : Boolean Read Ffloating Write Ffloating;
    Property quick : Boolean Read Fquick Write Fquick;
    Property direction : String Read Fdirection Write Fdirection;
  end;
  
  Tdata = Array of TdataItem;

Procedure ClearArray(var anArray : Tdata); overload;
Function CreateTdata(AJSON : TJSONData) : Tdata;
Procedure SaveTdataToJSON(AnArray : Tdata; AJSONArray : TJSONArray); overload;
Function SaveTdataToJSON(AnArray : Tdata) : TJSONArray; overload;


Type
  
  
  { -----------------------------------------------------------------------
    TMyObjectPf
    -----------------------------------------------------------------------}
  
  TMyObjectPf = class(TObject)
  Private
    Fdata : Tdata;
  Public
    Destructor Destroy; override;
    Constructor CreateFromJSON(AJSON : TJSONData); virtual;
    Procedure LoadFromJSON(AJSON : TJSONData); virtual;
    Function SaveToJSON : TJSONObject; overload;
    Procedure SaveToJSON(AJSON : TJSONObject); overload; virtual;
    Property data : Tdata Read Fdata Write Fdata;
  end;

implementation






Function CreateTdataIteminterface(AJSON : TJSONData) : TdataIteminterface;

var
  I : integer;

begin
  SetLength(Result,AJSON.Count);
  For I:=0 to AJSON.Count-1 do
    Result[i]:=AJSON.Items[i].AsString;
End;


Function SaveTdataIteminterfaceToJSON(AnArray : TdataIteminterface) : TJSONArray;
begin
  Result:=TJSONArray.Create;
  Try
    SaveTdataIteminterfaceToJSON(AnArray,Result);
  Except
    FreeAndNil(Result);
    Raise;
  end;
end;


Procedure SaveTdataIteminterfaceToJSON(AnArray : TdataIteminterface; AJSONArray : TJSONArray);

var
  I : integer;

begin
  For I:=0 to Length(AnArray)-1 do
    AJSONArray.Add(AnArray[i]);
end;



{ -----------------------------------------------------------------------
  TdataItem
  -----------------------------------------------------------------------}


Constructor TdataItem.CreateFromJSON(AJSON : TJSONData);

begin
  Create();
  LoadFromJSON(AJSON);
end;

Procedure TdataItem.LoadFromJSON(AJSON : TJSONData);

var
  E : TJSONEnum;

begin
  for E in AJSON do
    begin
    case E.Key of
    'type':
      _type:=E.Value.AsString;
    'interface':
      _interface:=CreateTdataIteminterface(E.Value);
    'ipprotocol':
      ipprotocol:=E.Value.AsString;
    'protocol':
      protocol:=E.Value.AsString;
    'source':
      source:=E.Value.AsString;
    'source_port':
      source_port:=E.Value.AsString;
    'destination':
      destination:=E.Value.AsString;
    'destination_port':
      destination_port:=E.Value.AsString;
    'descr':
      descr:=E.Value.AsString;
    'disabled':
      disabled:=E.Value.AsBoolean;
    'log':
      log:=E.Value.AsBoolean;
    'tag':
      tag:=E.Value.AsString;
    'statetype':
      statetype:=E.Value.AsString;
    'tcp_flags_any':
      tcp_flags_any:=E.Value.AsBoolean;
    'sched':
      sched:=E.Value.AsString;
    'floating':
      floating:=E.Value.AsBoolean;
    'quick':
      quick:=E.Value.AsBoolean;
    'direction':
      direction:=E.Value.AsString;
    end;
    end;
end;
Function  TdataItem.SaveToJSON : TJSONObject;
begin
  Result:=TJSONObject.Create;
  Try
    SaveToJSON(Result);
  except
    FreeAndNil(Result);
    Raise;
  end;
end;


Procedure TdataItem.SaveToJSON(AJSON : TJSONObject);

begin
  AJSON.Add('type',_type);
  AJSON.Add('interface',SaveTdataIteminterfaceToJSON(_interface));
  AJSON.Add('ipprotocol',ipprotocol);
  AJSON.Add('protocol',protocol);
  AJSON.Add('source',source);
  AJSON.Add('source_port',source_port);
  AJSON.Add('destination',destination);
  AJSON.Add('destination_port',destination_port);
  AJSON.Add('descr',descr);
  AJSON.Add('disabled',disabled);
  AJSON.Add('log',log);
  AJSON.Add('tag',tag);
  AJSON.Add('statetype',statetype);
  AJSON.Add('tcp_flags_any',tcp_flags_any);
  AJSON.Add('sched',sched);
  AJSON.Add('floating',floating);
  AJSON.Add('quick',quick);
  AJSON.Add('direction',direction);
end;


Procedure ClearArray(Var anArray : Tdata);

var
  I : integer;

begin
  For I:=0 to Length(anArray)-1 do
    FreeAndNil(anArray[I]);
  SetLength(anArray,0);
End;


Function CreateTdata(AJSON : TJSONData) : Tdata;

var
  I : integer;

begin
  SetLength(Result,AJSON.Count);
  For I:=0 to AJSON.Count-1 do
    Result[i]:=TdataItem.CreateFromJSON(AJSON.Items[i]);
End;


Function SaveTdataToJSON(AnArray : Tdata) : TJSONArray;
begin
  Result:=TJSONArray.Create;
  Try
    SaveTdataToJSON(AnArray,Result);
  Except
    FreeAndNil(Result);
    Raise;
  end;
end;


Procedure SaveTdataToJSON(AnArray : Tdata; AJSONArray : TJSONArray);

var
  I : integer;

begin
  For I:=0 to Length(AnArray)-1 do
    AJSONArray.Add(AnArray[i].SaveToJSON);
end;



{ -----------------------------------------------------------------------
  TMyObjectPf
  -----------------------------------------------------------------------}

Destructor TMyObjectPf.Destroy;

begin
  ClearArray(Fdata);
  inherited;
end;


Constructor TMyObjectPf.CreateFromJSON(AJSON : TJSONData);

begin
  Create();
  LoadFromJSON(AJSON);
end;

Procedure TMyObjectPf.LoadFromJSON(AJSON : TJSONData);

var
  E : TJSONEnum;

begin
  for E in AJSON do
    begin
    case E.Key of
    'data':
      data:=CreateTdata(E.Value);
    end;
    end;
end;
Function  TMyObjectPf.SaveToJSON : TJSONObject;
begin
  Result:=TJSONObject.Create;
  Try
    SaveToJSON(Result);
  except
    FreeAndNil(Result);
    Raise;
  end;
end;


Procedure TMyObjectPf.SaveToJSON(AJSON : TJSONObject);

begin
  AJSON.Add('data',SaveTdataToJSON(data));
end;

end.
