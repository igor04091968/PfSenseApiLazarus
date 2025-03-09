unit fi_id_update;

interface

uses SysUtils, Classes, fpJSON;


Type
  
  Tdatainterface = Array of String;

Function CreateTdatainterface(AJSON : TJSONData) : Tdatainterface;
Procedure SaveTdatainterfaceToJSON(AnArray : Tdatainterface; AJSONArray : TJSONArray); overload;
Function SaveTdatainterfaceToJSON(AnArray : Tdatainterface) : TJSONArray; overload;


Type
  
  
  { -----------------------------------------------------------------------
    Tdata
    -----------------------------------------------------------------------}
  
  Tdata = class(TObject)
  Private
    Fid : Integer;
    F_type : String;
    F_interface : Tdatainterface;
    Fipprotocol : String;
    Fprotocol : String;
    Ficmptype : Boolean;
    Fsource : String;
    Fsource_port : Boolean;
    Fdestination : String;
    Fdestination_port : String;
    Fdescr : String;
    Fdisabled : Boolean;
    Flog : Boolean;
    Ftag : String;
    Fstatetype : String;
    Ftcp_flags_any : Boolean;
    Ftcp_flags_out_of : Boolean;
    Ftcp_flags_set : Boolean;
    Fgateway : Boolean;
    Fsched : String;
    Fdnpipe : Boolean;
    Fpdnpipe : Boolean;
    Fdefaultqueue : Boolean;
    Fackqueue : Boolean;
    Ffloating : Boolean;
    Fquick : Boolean;
    Fdirection : Boolean;
    Ftracker : Integer;
    Fassociated_rule_id : Boolean;
    Fcreated_time : Integer;
    Fcreated_by : String;
    Fupdated_time : Integer;
    Fupdated_by : String;
  Public
    Constructor CreateFromJSON(AJSON : TJSONData); virtual;
    Procedure LoadFromJSON(AJSON : TJSONData); virtual;
    Function SaveToJSON : TJSONObject; overload;
    Procedure SaveToJSON(AJSON : TJSONObject); overload; virtual;
    Property id : Integer Read Fid Write Fid;
    Property _type : String Read F_type Write F_type;
    Property _interface : Tdatainterface Read F_interface Write F_interface;
    Property ipprotocol : String Read Fipprotocol Write Fipprotocol;
    Property protocol : String Read Fprotocol Write Fprotocol;
    Property icmptype : Boolean Read Ficmptype Write Ficmptype;
    Property source : String Read Fsource Write Fsource;
    Property source_port : Boolean Read Fsource_port Write Fsource_port;
    Property destination : String Read Fdestination Write Fdestination;
    Property destination_port : String Read Fdestination_port Write Fdestination_port;
    Property descr : String Read Fdescr Write Fdescr;
    Property disabled : Boolean Read Fdisabled Write Fdisabled;
    Property log : Boolean Read Flog Write Flog;
    Property tag : String Read Ftag Write Ftag;
    Property statetype : String Read Fstatetype Write Fstatetype;
    Property tcp_flags_any : Boolean Read Ftcp_flags_any Write Ftcp_flags_any;
    Property tcp_flags_out_of : Boolean Read Ftcp_flags_out_of Write Ftcp_flags_out_of;
    Property tcp_flags_set : Boolean Read Ftcp_flags_set Write Ftcp_flags_set;
    Property gateway : Boolean Read Fgateway Write Fgateway;
    Property sched : String Read Fsched Write Fsched;
    Property dnpipe : Boolean Read Fdnpipe Write Fdnpipe;
    Property pdnpipe : Boolean Read Fpdnpipe Write Fpdnpipe;
    Property defaultqueue : Boolean Read Fdefaultqueue Write Fdefaultqueue;
    Property ackqueue : Boolean Read Fackqueue Write Fackqueue;
    Property floating : Boolean Read Ffloating Write Ffloating;
    Property quick : Boolean Read Fquick Write Fquick;
    Property direction : Boolean Read Fdirection Write Fdirection;
    Property tracker : Integer Read Ftracker Write Ftracker;
    Property associated_rule_id : Boolean Read Fassociated_rule_id Write Fassociated_rule_id;
    Property created_time : Integer Read Fcreated_time Write Fcreated_time;
    Property created_by : String Read Fcreated_by Write Fcreated_by;
    Property updated_time : Integer Read Fupdated_time Write Fupdated_time;
    Property updated_by : String Read Fupdated_by Write Fupdated_by;
  end;
  
  
  { -----------------------------------------------------------------------
    TMyObjectPF
    -----------------------------------------------------------------------}
  
  TMyObjectPF = class(TObject)
  Private
    Fcode : Integer;
    Fstatus : String;
    Fresponse_id : String;
    Fmessage : String;
    Fdata : Tdata;
  Public
    Destructor Destroy; override;
    Constructor CreateFromJSON(AJSON : TJSONData); virtual;
    Procedure LoadFromJSON(AJSON : TJSONData); virtual;
    Function SaveToJSON : TJSONObject; overload;
    Procedure SaveToJSON(AJSON : TJSONObject); overload; virtual;
    Property code : Integer Read Fcode Write Fcode;
    Property status : String Read Fstatus Write Fstatus;
    Property response_id : String Read Fresponse_id Write Fresponse_id;
    Property message : String Read Fmessage Write Fmessage;
    Property data : Tdata Read Fdata Write Fdata;
  end;

implementation





Function CreateTdatainterface(AJSON : TJSONData) : Tdatainterface;

var
  I : integer;

begin
  SetLength(Result,AJSON.Count);
  For I:=0 to AJSON.Count-1 do
    Result[i]:=AJSON.Items[i].AsString;
End;


Function SaveTdatainterfaceToJSON(AnArray : Tdatainterface) : TJSONArray;
begin
  Result:=TJSONArray.Create;
  Try
    SaveTdatainterfaceToJSON(AnArray,Result);
  Except
    FreeAndNil(Result);
    Raise;
  end;
end;


Procedure SaveTdatainterfaceToJSON(AnArray : Tdatainterface; AJSONArray : TJSONArray);

var
  I : integer;

begin
  For I:=0 to Length(AnArray)-1 do
    AJSONArray.Add(AnArray[i]);
end;



{ -----------------------------------------------------------------------
  Tdata
  -----------------------------------------------------------------------}


Constructor Tdata.CreateFromJSON(AJSON : TJSONData);

begin
  Create();
  LoadFromJSON(AJSON);
end;

Procedure Tdata.LoadFromJSON(AJSON : TJSONData);

var
  E : TJSONEnum;

begin
  for E in AJSON do
    begin
    case E.Key of
    'id':
      id:=E.Value.AsInteger;
    'type':
      _type:=E.Value.AsString;
    'interface':
      _interface:=CreateTdatainterface(E.Value);
    'ipprotocol':
      ipprotocol:=E.Value.AsString;
    'protocol':
      protocol:=E.Value.AsString;
    'icmptype':
      icmptype:=E.Value.AsBoolean;
    'source':
      source:=E.Value.AsString;
    'source_port':
      source_port:=E.Value.AsBoolean;
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
    'tcp_flags_out_of':
      tcp_flags_out_of:=E.Value.AsBoolean;
    'tcp_flags_set':
      tcp_flags_set:=E.Value.AsBoolean;
    'gateway':
      gateway:=E.Value.AsBoolean;
    'sched':
      sched:=E.Value.AsString;
    'dnpipe':
      dnpipe:=E.Value.AsBoolean;
    'pdnpipe':
      pdnpipe:=E.Value.AsBoolean;
    'defaultqueue':
      defaultqueue:=E.Value.AsBoolean;
    'ackqueue':
      ackqueue:=E.Value.AsBoolean;
    'floating':
      floating:=E.Value.AsBoolean;
    'quick':
      quick:=E.Value.AsBoolean;
    'direction':
      direction:=E.Value.AsBoolean;
    'tracker':
      tracker:=E.Value.AsInteger;
    'associated_rule_id':
      associated_rule_id:=E.Value.AsBoolean;
    'created_time':
      created_time:=E.Value.AsInteger;
    'created_by':
      created_by:=E.Value.AsString;
    'updated_time':
      updated_time:=E.Value.AsInteger;
    'updated_by':
      updated_by:=E.Value.AsString;
    end;
    end;
end;
Function  Tdata.SaveToJSON : TJSONObject;
begin
  Result:=TJSONObject.Create;
  Try
    SaveToJSON(Result);
  except
    FreeAndNil(Result);
    Raise;
  end;
end;


Procedure Tdata.SaveToJSON(AJSON : TJSONObject);

begin
  AJSON.Add('id',id);
  AJSON.Add('type',_type);
  AJSON.Add('interface',SaveTdatainterfaceToJSON(_interface));
  AJSON.Add('ipprotocol',ipprotocol);
  AJSON.Add('protocol',protocol);
  AJSON.Add('icmptype',icmptype);
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
  AJSON.Add('tcp_flags_out_of',tcp_flags_out_of);
  AJSON.Add('tcp_flags_set',tcp_flags_set);
  AJSON.Add('gateway',gateway);
  AJSON.Add('sched',sched);
  AJSON.Add('dnpipe',dnpipe);
  AJSON.Add('pdnpipe',pdnpipe);
  AJSON.Add('defaultqueue',defaultqueue);
  AJSON.Add('ackqueue',ackqueue);
  AJSON.Add('floating',floating);
  AJSON.Add('quick',quick);
  AJSON.Add('direction',direction);
  AJSON.Add('tracker',tracker);
  AJSON.Add('associated_rule_id',associated_rule_id);
  AJSON.Add('created_time',created_time);
  AJSON.Add('created_by',created_by);
  AJSON.Add('updated_time',updated_time);
  AJSON.Add('updated_by',updated_by);
end;


{ -----------------------------------------------------------------------
  TMyObjectPF
  -----------------------------------------------------------------------}

Destructor TMyObjectPF.Destroy;

begin
  FreeAndNil(Fdata);
  inherited;
end;


Constructor TMyObjectPF.CreateFromJSON(AJSON : TJSONData);

begin
  Create();
  LoadFromJSON(AJSON);
end;

Procedure TMyObjectPF.LoadFromJSON(AJSON : TJSONData);

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
      data:=Tdata.CreateFromJSON(E.Value);
    end;
    end;
end;
Function  TMyObjectPF.SaveToJSON : TJSONObject;
begin
  Result:=TJSONObject.Create;
  Try
    SaveToJSON(Result);
  except
    FreeAndNil(Result);
    Raise;
  end;
end;


Procedure TMyObjectPF.SaveToJSON(AJSON : TJSONObject);

begin
  AJSON.Add('code',code);
  AJSON.Add('status',status);
  AJSON.Add('response_id',response_id);
  AJSON.Add('message',message);
  If Assigned(data) then
    AJSON.Add('data',data.SaveToJSON);
end;

end.
