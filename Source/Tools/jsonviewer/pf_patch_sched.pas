unit pf_patch_sched;

interface

uses SysUtils, Classes, fpJSON;


Type
  
  TdatatimerangeItemposition = Array of Integer;

Function CreateTdatatimerangeItemposition(AJSON : TJSONData) : TdatatimerangeItemposition;
Procedure SaveTdatatimerangeItempositionToJSON(AnArray : TdatatimerangeItemposition; AJSONArray : TJSONArray); overload;
Function SaveTdatatimerangeItempositionToJSON(AnArray : TdatatimerangeItemposition) : TJSONArray; overload;


Type
  
  
  { -----------------------------------------------------------------------
    TdatatimerangeItem
    -----------------------------------------------------------------------}
  
  TdatatimerangeItem = class(TObject)
  Private
    Fparent_id : Integer;
    Fid : Integer;
    Fposition : TdatatimerangeItemposition;
    Fmonth : Boolean;
    Fday : Boolean;
    Fhour : String;
    Frangedescr : String;
  Protected
    Procedure Setparent_id(AValue : Integer); virtual;
    Procedure Setid(AValue : Integer); virtual;
    Procedure Setposition(AValue : TdatatimerangeItemposition); virtual;
    Procedure Setmonth(AValue : Boolean); virtual;
    Procedure Setday(AValue : Boolean); virtual;
    Procedure Sethour(AValue : String); virtual;
    Procedure Setrangedescr(AValue : String); virtual;
  Public
    Destructor Destroy; override;
    Constructor CreateFromJSON(AJSON : TJSONData); virtual;
    Procedure LoadFromJSON(AJSON : TJSONData); virtual;
    Function SaveToJSON : TJSONObject; overload;
    Procedure SaveToJSON(AJSON : TJSONObject); overload; virtual;
    Property parent_id : Integer Read Fparent_id Write Setparent_id;
    Property id : Integer Read Fid Write Setid;
    Property position : TdatatimerangeItemposition Read Fposition Write Setposition;
    Property month : Boolean Read Fmonth Write Setmonth;
    Property day : Boolean Read Fday Write Setday;
    Property hour : String Read Fhour Write Sethour;
    Property rangedescr : String Read Frangedescr Write Setrangedescr;
  end;
  
  Tdatatimerange = Array of TdatatimerangeItem;

Procedure ClearArray(var anArray : Tdatatimerange); overload;
Function CreateTdatatimerange(AJSON : TJSONData) : Tdatatimerange;
Procedure SaveTdatatimerangeToJSON(AnArray : Tdatatimerange; AJSONArray : TJSONArray); overload;
Function SaveTdatatimerangeToJSON(AnArray : Tdatatimerange) : TJSONArray; overload;


Type
  
  
  { -----------------------------------------------------------------------
    Tdata
    -----------------------------------------------------------------------}
  
  Tdata = class(TObject)
  Private
    Fid : Integer;
    Fschedlabel : String;
    Fname : String;
    Fdescr : String;
    Factive : Boolean;
    Ftimerange : Tdatatimerange;
  Protected
    Procedure Setid(AValue : Integer); virtual;
    Procedure Setschedlabel(AValue : String); virtual;
    Procedure Setname(AValue : String); virtual;
    Procedure Setdescr(AValue : String); virtual;
    Procedure Setactive(AValue : Boolean); virtual;
    Procedure Settimerange(AValue : Tdatatimerange); virtual;
  Public
    Destructor Destroy; override;
    Constructor CreateFromJSON(AJSON : TJSONData); virtual;
    Procedure LoadFromJSON(AJSON : TJSONData); virtual;
    Function SaveToJSON : TJSONObject; overload;
    Procedure SaveToJSON(AJSON : TJSONObject); overload; virtual;
    Property id : Integer Read Fid Write Setid;
    Property schedlabel : String Read Fschedlabel Write Setschedlabel;
    Property name : String Read Fname Write Setname;
    Property descr : String Read Fdescr Write Setdescr;
    Property active : Boolean Read Factive Write Setactive;
    Property timerange : Tdatatimerange Read Ftimerange Write Settimerange;
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
    Fdata : Tdata;
  Protected
    Procedure Setcode(AValue : Integer); virtual;
    Procedure Setstatus(AValue : String); virtual;
    Procedure Setresponse_id(AValue : String); virtual;
    Procedure Setmessage(AValue : String); virtual;
    Procedure Setdata(AValue : Tdata); virtual;
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
    Property data : Tdata Read Fdata Write Setdata;
  end;

implementation







Function CreateTdatatimerangeItemposition(AJSON : TJSONData) : TdatatimerangeItemposition;

var
  I : integer;

begin
  SetLength(Result,AJSON.Count);
  For I:=0 to AJSON.Count-1 do
    Result[i]:=AJSON.Items[i].AsInteger;
End;


Function SaveTdatatimerangeItempositionToJSON(AnArray : TdatatimerangeItemposition) : TJSONArray;
begin
  Result:=TJSONArray.Create;
  Try
    SaveTdatatimerangeItempositionToJSON(AnArray,Result);
  Except
    FreeAndNil(Result);
    Raise;
  end;
end;


Procedure SaveTdatatimerangeItempositionToJSON(AnArray : TdatatimerangeItemposition; AJSONArray : TJSONArray);

var
  I : integer;

begin
  For I:=0 to Length(AnArray)-1 do
    AJSONArray.Add(AnArray[i]);
end;



{ -----------------------------------------------------------------------
  TdatatimerangeItem
  -----------------------------------------------------------------------}


Procedure TdatatimerangeItem.Setparent_id(AValue : Integer);

begin
  if (Fparent_id=AValue) then exit;
  Fparent_id:=AValue;
end;

Procedure TdatatimerangeItem.Setid(AValue : Integer);

begin
  if (Fid=AValue) then exit;
  Fid:=AValue;
end;

Procedure TdatatimerangeItem.Setposition(AValue : TdatatimerangeItemposition);

begin
  if (Fposition=AValue) then exit;
  Fposition:=AValue;
end;

Procedure TdatatimerangeItem.Setmonth(AValue : Boolean);

begin
  if (Fmonth=AValue) then exit;
  Fmonth:=AValue;
end;

Procedure TdatatimerangeItem.Setday(AValue : Boolean);

begin
  if (Fday=AValue) then exit;
  Fday:=AValue;
end;

Procedure TdatatimerangeItem.Sethour(AValue : String);

begin
  if (Fhour=AValue) then exit;
  Fhour:=AValue;
end;

Procedure TdatatimerangeItem.Setrangedescr(AValue : String);

begin
  if (Frangedescr=AValue) then exit;
  Frangedescr:=AValue;
end;

Constructor TdatatimerangeItem.CreateFromJSON(AJSON : TJSONData);

begin
  Create();
  LoadFromJSON(AJSON);
end;

Procedure TdatatimerangeItem.LoadFromJSON(AJSON : TJSONData);

var
  E : TJSONEnum;

begin
  for E in AJSON do
    begin
    case lowercase(E.Key) of
    'parent_id':
      parent_id:=E.Value.AsInteger;
    'id':
      id:=E.Value.AsInteger;
    'position':
      position:=CreateTdatatimerangeItemposition(E.Value);
    'month':
      month:=E.Value.AsBoolean;
    'day':
      day:=E.Value.AsBoolean;
    'hour':
      hour:=E.Value.AsString;
    'rangedescr':
      rangedescr:=E.Value.AsString;
    end;
    end;
end;
Function  TdatatimerangeItem.SaveToJSON : TJSONObject;
begin
  Result:=TJSONObject.Create;
  Try
    SaveToJSON(Result);
  except
    FreeAndNil(Result);
    Raise;
  end;
end;


Procedure TdatatimerangeItem.SaveToJSON(AJSON : TJSONObject);

begin
  AJSON.Add('parent_id',parent_id);
  AJSON.Add('id',id);
  AJSON.Add('position',SaveTdatatimerangeItempositionToJSON(position));
  AJSON.Add('month',month);
  AJSON.Add('day',day);
  AJSON.Add('hour',hour);
  AJSON.Add('rangedescr',rangedescr);
end;


Procedure ClearArray(Var anArray : Tdatatimerange);

var
  I : integer;

begin
  For I:=0 to Length(anArray)-1 do
    FreeAndNil(anArray[I]);
  SetLength(anArray,0);
End;


Function CreateTdatatimerange(AJSON : TJSONData) : Tdatatimerange;

var
  I : integer;

begin
  SetLength(Result,AJSON.Count);
  For I:=0 to AJSON.Count-1 do
    Result[i]:=TdatatimerangeItem.CreateFromJSON(AJSON.Items[i]);
End;


Function SaveTdatatimerangeToJSON(AnArray : Tdatatimerange) : TJSONArray;
begin
  Result:=TJSONArray.Create;
  Try
    SaveTdatatimerangeToJSON(AnArray,Result);
  Except
    FreeAndNil(Result);
    Raise;
  end;
end;


Procedure SaveTdatatimerangeToJSON(AnArray : Tdatatimerange; AJSONArray : TJSONArray);

var
  I : integer;

begin
  For I:=0 to Length(AnArray)-1 do
    AJSONArray.Add(AnArray[i].SaveToJSON);
end;



{ -----------------------------------------------------------------------
  Tdata
  -----------------------------------------------------------------------}

Destructor Tdata.Destroy;

begin
  ClearArray(Ftimerange);
  inherited;
end;


Procedure Tdata.Setid(AValue : Integer);

begin
  if (Fid=AValue) then exit;
  Fid:=AValue;
end;

Procedure Tdata.Setschedlabel(AValue : String);

begin
  if (Fschedlabel=AValue) then exit;
  Fschedlabel:=AValue;
end;

Procedure Tdata.Setname(AValue : String);

begin
  if (Fname=AValue) then exit;
  Fname:=AValue;
end;

Procedure Tdata.Setdescr(AValue : String);

begin
  if (Fdescr=AValue) then exit;
  Fdescr:=AValue;
end;

Procedure Tdata.Setactive(AValue : Boolean);

begin
  if (Factive=AValue) then exit;
  Factive:=AValue;
end;

Procedure Tdata.Settimerange(AValue : Tdatatimerange);

begin
  if (Ftimerange=AValue) then exit;
  Ftimerange:=AValue;
end;

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
    case lowercase(E.Key) of
    'id':
      id:=E.Value.AsInteger;
    'schedlabel':
      schedlabel:=E.Value.AsString;
    'name':
      name:=E.Value.AsString;
    'descr':
      descr:=E.Value.AsString;
    'active':
      active:=E.Value.AsBoolean;
    'timerange':
      timerange:=CreateTdatatimerange(E.Value);
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
  AJSON.Add('schedlabel',schedlabel);
  AJSON.Add('name',name);
  AJSON.Add('descr',descr);
  AJSON.Add('active',active);
  AJSON.Add('timerange',SaveTdatatimerangeToJSON(timerange));
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

Procedure TMyObject.Setdata(AValue : Tdata);

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
    case lowercase(E.Key) of
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
