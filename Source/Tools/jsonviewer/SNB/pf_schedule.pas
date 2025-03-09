unit pf_schedule;

interface

uses SysUtils, Classes, fpJSON;


Type
  
  TdataItemtimerangeItemmonth = Array of Integer;

Function CreateTdataItemtimerangeItemmonth(AJSON : TJSONData) : TdataItemtimerangeItemmonth;
Procedure SaveTdataItemtimerangeItemmonthToJSON(AnArray : TdataItemtimerangeItemmonth; AJSONArray : TJSONArray); overload;
Function SaveTdataItemtimerangeItemmonthToJSON(AnArray : TdataItemtimerangeItemmonth) : TJSONArray; overload;


Type
  
  TdataItemtimerangeItemday = Array of Integer;

Function CreateTdataItemtimerangeItemday(AJSON : TJSONData) : TdataItemtimerangeItemday;
Procedure SaveTdataItemtimerangeItemdayToJSON(AnArray : TdataItemtimerangeItemday; AJSONArray : TJSONArray); overload;
Function SaveTdataItemtimerangeItemdayToJSON(AnArray : TdataItemtimerangeItemday) : TJSONArray; overload;


Type
  
  
  { -----------------------------------------------------------------------
    TdataItemtimerangeItem
    -----------------------------------------------------------------------}
  
  TdataItemtimerangeItem = class(TObject)
  Private
    Fmonth : TdataItemtimerangeItemmonth;
    Fday : TdataItemtimerangeItemday;
    Fhour : String;
    Frangedescr : String;
  Public
    Destructor Destroy; override;
    Constructor CreateFromJSON(AJSON : TJSONData); virtual;
    Procedure LoadFromJSON(AJSON : TJSONData); virtual;
    Function SaveToJSON : TJSONObject; overload;
    Procedure SaveToJSON(AJSON : TJSONObject); overload; virtual;
    Property month : TdataItemtimerangeItemmonth Read Fmonth Write Fmonth;
    Property day : TdataItemtimerangeItemday Read Fday Write Fday;
    Property hour : String Read Fhour Write Fhour;
    Property rangedescr : String Read Frangedescr Write Frangedescr;
  end;
  
  TdataItemtimerange = Array of TdataItemtimerangeItem;

Procedure ClearArray(var anArray : TdataItemtimerange); overload;
Function CreateTdataItemtimerange(AJSON : TJSONData) : TdataItemtimerange;
Procedure SaveTdataItemtimerangeToJSON(AnArray : TdataItemtimerange; AJSONArray : TJSONArray); overload;
Function SaveTdataItemtimerangeToJSON(AnArray : TdataItemtimerange) : TJSONArray; overload;


Type
  
  
  { -----------------------------------------------------------------------
    TdataItem
    -----------------------------------------------------------------------}
  
  TdataItem = class(TObject)
  Private
    Fname : String;
    Fdescr : String;
    Factive : Boolean;
    Ftimerange : TdataItemtimerange;
  Public
    Destructor Destroy; override;
    Constructor CreateFromJSON(AJSON : TJSONData); virtual;
    Procedure LoadFromJSON(AJSON : TJSONData); virtual;
    Function SaveToJSON : TJSONObject; overload;
    Procedure SaveToJSON(AJSON : TJSONObject); overload; virtual;
    Property name : String Read Fname Write Fname;
    Property descr : String Read Fdescr Write Fdescr;
    Property active : Boolean Read Factive Write Factive;
    Property timerange : TdataItemtimerange Read Ftimerange Write Ftimerange;
  end;
  
  Tdata = Array of TdataItem;

Procedure ClearArray(var anArray : Tdata); overload;
Function CreateTdata(AJSON : TJSONData) : Tdata;
Procedure SaveTdataToJSON(AnArray : Tdata; AJSONArray : TJSONArray); overload;
Function SaveTdataToJSON(AnArray : Tdata) : TJSONArray; overload;


Type
  
  
  { -----------------------------------------------------------------------
    TMyObjectSched
    -----------------------------------------------------------------------}
  
  TMyObjectSched = class(TObject)
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








Function CreateTdataItemtimerangeItemmonth(AJSON : TJSONData) : TdataItemtimerangeItemmonth;

var
  I : integer;

begin
  SetLength(Result,AJSON.Count);
  For I:=0 to AJSON.Count-1 do
    Result[i]:=AJSON.Items[i].AsInteger;
End;


Function SaveTdataItemtimerangeItemmonthToJSON(AnArray : TdataItemtimerangeItemmonth) : TJSONArray;
begin
  Result:=TJSONArray.Create;
  Try
    SaveTdataItemtimerangeItemmonthToJSON(AnArray,Result);
  Except
    FreeAndNil(Result);
    Raise;
  end;
end;


Procedure SaveTdataItemtimerangeItemmonthToJSON(AnArray : TdataItemtimerangeItemmonth; AJSONArray : TJSONArray);

var
  I : integer;

begin
  For I:=0 to Length(AnArray)-1 do
    AJSONArray.Add(AnArray[i]);
end;




Function CreateTdataItemtimerangeItemday(AJSON : TJSONData) : TdataItemtimerangeItemday;

var
  I : integer;

begin
  SetLength(Result,AJSON.Count);
  For I:=0 to AJSON.Count-1 do
    Result[i]:=AJSON.Items[i].AsInteger;
End;


Function SaveTdataItemtimerangeItemdayToJSON(AnArray : TdataItemtimerangeItemday) : TJSONArray;
begin
  Result:=TJSONArray.Create;
  Try
    SaveTdataItemtimerangeItemdayToJSON(AnArray,Result);
  Except
    FreeAndNil(Result);
    Raise;
  end;
end;


Procedure SaveTdataItemtimerangeItemdayToJSON(AnArray : TdataItemtimerangeItemday; AJSONArray : TJSONArray);

var
  I : integer;

begin
  For I:=0 to Length(AnArray)-1 do
    AJSONArray.Add(AnArray[i]);
end;



{ -----------------------------------------------------------------------
  TdataItemtimerangeItem
  -----------------------------------------------------------------------}


Constructor TdataItemtimerangeItem.CreateFromJSON(AJSON : TJSONData);

begin
  Create();
  LoadFromJSON(AJSON);
end;

Procedure TdataItemtimerangeItem.LoadFromJSON(AJSON : TJSONData);

var
  E : TJSONEnum;

begin
  for E in AJSON do
    begin
    case E.Key of
    'month':
      month:=CreateTdataItemtimerangeItemmonth(E.Value);
    'day':
      day:=CreateTdataItemtimerangeItemday(E.Value);
    'hour':
      hour:=E.Value.AsString;
    'rangedescr':
      rangedescr:=E.Value.AsString;
    end;
    end;
end;
Function  TdataItemtimerangeItem.SaveToJSON : TJSONObject;
begin
  Result:=TJSONObject.Create;
  Try
    SaveToJSON(Result);
  except
    FreeAndNil(Result);
    Raise;
  end;
end;


Procedure TdataItemtimerangeItem.SaveToJSON(AJSON : TJSONObject);

begin
  AJSON.Add('month',SaveTdataItemtimerangeItemmonthToJSON(month));
  AJSON.Add('day',SaveTdataItemtimerangeItemdayToJSON(day));
  AJSON.Add('hour',hour);
  AJSON.Add('rangedescr',rangedescr);
end;


Procedure ClearArray(Var anArray : TdataItemtimerange);

var
  I : integer;

begin
  For I:=0 to Length(anArray)-1 do
    FreeAndNil(anArray[I]);
  SetLength(anArray,0);
End;


Function CreateTdataItemtimerange(AJSON : TJSONData) : TdataItemtimerange;

var
  I : integer;

begin
  SetLength(Result,AJSON.Count);
  For I:=0 to AJSON.Count-1 do
    Result[i]:=TdataItemtimerangeItem.CreateFromJSON(AJSON.Items[i]);
End;


Function SaveTdataItemtimerangeToJSON(AnArray : TdataItemtimerange) : TJSONArray;
begin
  Result:=TJSONArray.Create;
  Try
    SaveTdataItemtimerangeToJSON(AnArray,Result);
  Except
    FreeAndNil(Result);
    Raise;
  end;
end;


Procedure SaveTdataItemtimerangeToJSON(AnArray : TdataItemtimerange; AJSONArray : TJSONArray);

var
  I : integer;

begin
  For I:=0 to Length(AnArray)-1 do
    AJSONArray.Add(AnArray[i].SaveToJSON);
end;



{ -----------------------------------------------------------------------
  TdataItem
  -----------------------------------------------------------------------}

Destructor TdataItem.Destroy;

begin
  ClearArray(Ftimerange);
  inherited;
end;


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
    'name':
      name:=E.Value.AsString;
    'descr':
      descr:=E.Value.AsString;
    'active':
      active:=E.Value.AsBoolean;
    'timerange':
      timerange:=CreateTdataItemtimerange(E.Value);
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
  AJSON.Add('name',name);
  AJSON.Add('descr',descr);
  AJSON.Add('active',active);
  AJSON.Add('timerange',SaveTdataItemtimerangeToJSON(timerange));
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
  TMyObjectSched
  -----------------------------------------------------------------------}

Destructor TMyObjectSched.Destroy;

begin
  ClearArray(Fdata);
  inherited;
end;


Constructor TMyObjectSched.CreateFromJSON(AJSON : TJSONData);

begin
  Create();
  LoadFromJSON(AJSON);
end;

Procedure TMyObjectSched.LoadFromJSON(AJSON : TJSONData);

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
Function  TMyObjectSched.SaveToJSON : TJSONObject;
begin
  Result:=TJSONObject.Create;
  Try
    SaveToJSON(Result);
  except
    FreeAndNil(Result);
    Raise;
  end;
end;


Procedure TMyObjectSched.SaveToJSON(AJSON : TJSONObject);

begin
  AJSON.Add('data',SaveTdataToJSON(data));
end;

end.
