' --------------------------------------------------------------------
' Script Created by RMxprt to generate Maxwell 2D Version 13.0 design 
' Can specify one arg to setup external circuit                       
' --------------------------------------------------------------------

Set oAnsoftApp = CreateObject("AnsoftMaxwell.MaxwellScriptInterface")
Set oDesktop = oAnsoftApp.GetAppDesktop()
Set oArgs = AnsoftScript.arguments
oDesktop.RestoreWindow
Set oProject = oDesktop.GetActiveProject()
Set oDesign = oProject.GetActiveDesign()
designName = oDesign.GetName
Set oEditor = oDesign.SetActiveEditor("3D Modeler")
oEditor.SetModelUnits Array("NAME:Units Parameter", "Units:=", "mm", _
  "Rescale:=", false)
oDesign.SetSolutionType "Transient", "XY"
Set oModule = oDesign.GetModule("BoundarySetup")
if (oArgs.Count = 1) then 
oModule.EditExternalCircuit oArgs(0), Array(), Array(), Array(), Array()
end if
oEditor.SetModelValidationSettings Array("NAME:Validation Options", _
  "EntityCheckLevel:=", "Strict", "IgnoreUnclassifiedObjects:=", true)
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:fractions", "PropType:=", "VariableProp", "UserDef:=", true, _
  "Value:=", "4"))))
Set oDefinitionManager = oProject.GetDefinitionManager()
oDefinitionManager.ModifyLibraries designName, Array("NAME:PersonalLib"), _
  Array("NAME:UserLib"), Array("NAME:SystemLib", "Materials:=", Array(_
  "Materials", "RMxprt"))
if (oDefinitionManager.DoesMaterialExist("steel_1010_2DSF0.980")) then
else
oDefinitionManager.AddMaterial Array("NAME:steel_1010_2DSF0.980", _
  "CoordinateSystemType:=", "Cartesian", Array("NAME:AttachedData"), Array(_
  "NAME:ModifierData"), Array("NAME:permeability", "property_type:=", _
  "nonlinear", "HUnit:=", "A_per_meter", "BUnit:=", "tesla", Array(_
  "NAME:BHCoordinates", Array("NAME:Coordinate", "X:=", 0, "Y:=", 0), Array(_
  "NAME:Coordinate", "X:=", 238.7, "Y:=", 0.1963), Array("NAME:Coordinate", _
  "X:=", 318.3, "Y:=", 0.314), Array("NAME:Coordinate", "X:=", 358.1, "Y:=", _
  0.39245), Array("NAME:Coordinate", "X:=", 437.7, "Y:=", 0.49055), Array(_
  "NAME:Coordinate", "X:=", 477.5, "Y:=", 0.5494), Array("NAME:Coordinate", _
  "X:=", 636.6, "Y:=", 0.775), Array("NAME:Coordinate", "X:=", 795.8, "Y:=", _
  0.9124), Array("NAME:Coordinate", "X:=", 1114.1, "Y:=", 1.0794), Array(_
  "NAME:Coordinate", "X:=", 1273.2, "Y:=", 1.1776), Array("NAME:Coordinate", _
  "X:=", 1591.5, "Y:=", 1.276), Array("NAME:Coordinate", "X:=", 2228.2, "Y:=", _
  1.3748), Array("NAME:Coordinate", "X:=", 3183.1, "Y:=", 1.4936), Array(_
  "NAME:Coordinate", "X:=", 4774.6, "Y:=", 1.5936), Array("NAME:Coordinate", _
  "X:=", 6366.2, "Y:=", 1.6642), Array("NAME:Coordinate", "X:=", 7957.7, _
  "Y:=", 1.6956), Array("NAME:Coordinate", "X:=", 15915.5, "Y:=", 1.833), _
  Array("NAME:Coordinate", "X:=", 31831, "Y:=", 1.951), Array(_
  "NAME:Coordinate", "X:=", 47746.5, "Y:=", 2.0004), Array("NAME:Coordinate", _
  "X:=", 63662, "Y:=", 2.0302), Array("NAME:Coordinate", "X:=", 79577.5, _
  "Y:=", 2.0551), Array("NAME:Coordinate", "X:=", 159155, "Y:=", 2.16), _
  Array("NAME:Coordinate", "X:=", 318310, "Y:=", 2.36), Array(_
  "NAME:Coordinate", "X:=", 1.90986e+006, "Y:=", 4.36))), "mass_density:=", _
  7872) 
end if
if (oDefinitionManager.DoesMaterialExist("steel_1010_2DSF0.950")) then
else
oDefinitionManager.AddMaterial Array("NAME:steel_1010_2DSF0.950", _
  "CoordinateSystemType:=", "Cartesian", Array("NAME:AttachedData"), Array(_
  "NAME:ModifierData"), Array("NAME:permeability", "property_type:=", _
  "nonlinear", "HUnit:=", "A_per_meter", "BUnit:=", "tesla", Array(_
  "NAME:BHCoordinates", Array("NAME:Coordinate", "X:=", 0, "Y:=", 0), Array(_
  "NAME:Coordinate", "X:=", 238.7, "Y:=", 0.1903), Array("NAME:Coordinate", _
  "X:=", 318.3, "Y:=", 0.3044), Array("NAME:Coordinate", "X:=", 358.1, "Y:=", _
  0.38045), Array("NAME:Coordinate", "X:=", 437.7, "Y:=", 0.47555), Array(_
  "NAME:Coordinate", "X:=", 477.5, "Y:=", 0.5326), Array("NAME:Coordinate", _
  "X:=", 636.6, "Y:=", 0.7513), Array("NAME:Coordinate", "X:=", 795.8, "Y:=", _
  0.8845), Array("NAME:Coordinate", "X:=", 1114.1, "Y:=", 1.0464), Array(_
  "NAME:Coordinate", "X:=", 1273.2, "Y:=", 1.1416), Array("NAME:Coordinate", _
  "X:=", 1591.5, "Y:=", 1.237), Array("NAME:Coordinate", "X:=", 2228.2, "Y:=", _
  1.3328), Array("NAME:Coordinate", "X:=", 3183.1, "Y:=", 1.448), Array(_
  "NAME:Coordinate", "X:=", 4774.6, "Y:=", 1.545), Array("NAME:Coordinate", _
  "X:=", 6366.2, "Y:=", 1.6135), Array("NAME:Coordinate", "X:=", 7957.7, _
  "Y:=", 1.644), Array("NAME:Coordinate", "X:=", 15915.5, "Y:=", 1.7775), _
  Array("NAME:Coordinate", "X:=", 31831, "Y:=", 1.8925), Array(_
  "NAME:Coordinate", "X:=", 47746.5, "Y:=", 1.941), Array("NAME:Coordinate", _
  "X:=", 63662, "Y:=", 1.9705), Array("NAME:Coordinate", "X:=", 79577.5, _
  "Y:=", 1.99525), Array("NAME:Coordinate", "X:=", 159155, "Y:=", 2.1), _
  Array("NAME:Coordinate", "X:=", 318310, "Y:=", 2.3), Array(_
  "NAME:Coordinate", "X:=", 1.90986e+006, "Y:=", 4.3))), "mass_density:=", _
  7872) 
end if
if (oDefinitionManager.DoesMaterialExist("NdFe35_2DSF1.000_N")) then
else
oDefinitionManager.AddMaterial Array("NAME:NdFe35_2DSF1.000_N", _
  "CoordinateSystemType:=", "Cylindrical", Array("NAME:AttachedData"), Array(_
  "NAME:ModifierData"), "permeability:=", "1.09978", Array(_
  "NAME:magnetic_coercivity", "property_type:=", "VectorProperty", _
  "Magnitude:=", "-890000A_per_meter", "DirComp1:=", "1", "DirComp2:=", "0", _
  "DirComp3:=", "0"))
end if
if (oDefinitionManager.DoesMaterialExist("NdFe35_2DSF1.000_S")) then
else
oDefinitionManager.AddMaterial Array("NAME:NdFe35_2DSF1.000_S", _
  "CoordinateSystemType:=", "Cylindrical", Array("NAME:AttachedData"), Array(_
  "NAME:ModifierData"), "permeability:=", "1.09978", Array(_
  "NAME:magnetic_coercivity", "property_type:=", "VectorProperty", _
  "Magnitude:=", "-890000A_per_meter", "DirComp1:=", "-1", "DirComp2:=", "0", _
  "DirComp3:=", "0"))
end if
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/Band", "Version:=", "12.1", "NoOfParameters:=", 7, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "34.5mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "50mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "3.75deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "HalfAxial", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "InfoCore", "Value:=", "0"))), Array(_
  "NAME:Attributes", "Name:=", "Band", "Flags:=", "", "Color:=", _
  "(0 255 255)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "vacuum", "SolveInside:=", true) 
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/Band", "Version:=", "12.1", "NoOfParameters:=", 7, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "34.5mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "18mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "3.75deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "HalfAxial", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "InfoCore", "Value:=", "100"))), Array(_
  "NAME:Attributes", "Name:=", "Shaft", "Flags:=", "", "Color:=", _
  "(0 255 255)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "steel_1010_2DSF0.980", "SolveInside:=", true) 
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/Band", "Version:=", "12.1", "NoOfParameters:=", 7, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "34.5mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "50mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "3.75deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", "4"), _
  Array("NAME:Pair", "Name:=", "HalfAxial", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "InfoCore", "Value:=", "100"))), Array(_
  "NAME:Attributes", "Name:=", "OuterRegion", "Flags:=", "", "Color:=", _
  "(0 255 255)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "vacuum", "SolveInside:=", true) 
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion:CreateUserDefinedPart:1", "Fractions", "fractions"
oEditor.Copy Array("NAME:Selections", "Selections:=", "OuterRegion")
oEditor.Paste
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion1:CreateUserDefinedPart:1", "InfoCore", "1"
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "OuterRegion1"), _
  Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "Tool"))))
oEditor.FitAll
Set oModule = oDesign.GetModule("ModelSetup")
oModule.SetSymmetryMultiplier "fractions"
Set oModule = oDesign.GetModule("BoundarySetup")
edgeID = oEditor.GetEdgeByPosition(Array("NAME:Parameters", "BodyName:=", _
  "OuterRegion", "XPosition:=", "17.677669529663689mm", "YPosition:=", _
  "17.677669529663685mm", "ZPosition:=", "0mm"))
oModule.AssignVectorPotential Array("NAME:VectorPotential1", "Edges:=", Array(edgeID), _
  "Value:=", "0", "CoordinateSystem:=", "")
edgeID = oEditor.GetEdgeByPosition(Array("NAME:Parameters", "BodyName:=", _
  "OuterRegion", "XPosition:=", "12.5mm", "YPosition:=", "0mm", "ZPosition:=", _
  "0mm"))
oModule.AssignMaster Array("NAME:Master1", "Edges:=", Array(edgeID), _
  "ReverseV:=", false)
edgeID = oEditor.GetEdgeByPosition(Array("NAME:Parameters", "BodyName:=", _
  "OuterRegion", "XPosition:=", "7.6540424946709576e-016mm", "YPosition:=", _
  "12.5mm", "ZPosition:=", "0mm"))
oModule.AssignSlave Array("NAME:Slave1", "Edges:=", Array(edgeID), _
  "ReverseU:=", true, "Master:=", "Master1", "SameAsMaster:=", true)
oDesign.SetDesignSettings Array("NAME:Design Settings Data", "ModelDepth:=", _
  "35mm")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/SlotCore", "Version:=", "12.1", "NoOfParameters:=", 19, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "34mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "18mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "12"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "0.5mm"), Array("NAME:Pair", "Name:=", "Hs01", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "Hs2", "Value:=", "4.366040492171818mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2.5mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "4.679508095996081mm"), Array("NAME:Pair", "Name:=", "Bs2", _
  "Value:=", "2.33975404799804mm"), Array("NAME:Pair", "Name:=", "Rs", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "FilletType", "Value:=", _
  "0"), Array("NAME:Pair", "Name:=", "HalfSlot", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "15deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "InfoCore", "Value:=", "0"))), Array("NAME:Attributes", "Name:=", "Stator", _
  "Flags:=", "", "Color:=", "(132 132 193)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", _
  "steel_1010_2DSF0.980", "SolveInside:=", true) 
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "34mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "18mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "12"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "0.5mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "4.366040492171818mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "2.5mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "4.679508095996081mm"), Array("NAME:Pair", _
  "Name:=", "Bs2", "Value:=", "2.33975404799804mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "Layers", _
  "Value:=", "2"), Array("NAME:Pair", "Name:=", "CoilPitch", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "SpanExt", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "5deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "InfoCoil", "Value:=", "2"))), _
  Array("NAME:Attributes", "Name:=", "Coil", "Flags:=", "", "Color:=", _
  "(250 167 14)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "copper", "SolveInside:=", true) 
oEditor.DuplicateAroundAxis Array("NAME:Selections", "Selections:=", "Coil"), _
  Array("NAME:DuplicateAroundAxisParameters", "CoordinateSystemID:=", -1, _
  "CreateNewObjects:=", true, "WhichAxis:=", "Z", "AngleStr:=", "30deg", _
  "NumClones:=", "12"), Array("NAME:Options", "DuplicateBoundaries:=", false)
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Coil"), Array(_
  "NAME:ChangedProps", Array("NAME:Name", "Value:=", "Coil_0"))))
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_0,Coil_3,Coil_6" & _
  ",Coil_9"), Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, _
  "KeepOriginals:=", false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_1,Coil_4,Coil_7" & _
  ",Coil_10"), Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, _
  "KeepOriginals:=", false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_2,Coil_5,Coil_8" & _
  ",Coil_11"), Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, _
  "KeepOriginals:=", false)
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "34mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "18mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "12"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "0.5mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "4.366040492171818mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "2.5mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "4.679508095996081mm"), Array("NAME:Pair", _
  "Name:=", "Bs2", "Value:=", "2.33975404799804mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "Layers", _
  "Value:=", "2"), Array("NAME:Pair", "Name:=", "CoilPitch", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "SpanExt", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "5deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "InfoCoil", "Value:=", "3"))), _
  Array("NAME:Attributes", "Name:=", "CoilRe", "Flags:=", "", "Color:=", _
  "(250 167 14)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "copper", "SolveInside:=", true) 
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilRe"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "-30deg")
oEditor.DuplicateAroundAxis Array("NAME:Selections", "Selections:=", "CoilRe"), _
  Array("NAME:DuplicateAroundAxisParameters", "CoordinateSystemID:=", -1, _
  "CreateNewObjects:=", true, "WhichAxis:=", "Z", "AngleStr:=", "30deg", _
  "NumClones:=", "12"), Array("NAME:Options", "DuplicateBoundaries:=", false)
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "CoilRe"), Array(_
  "NAME:ChangedProps", Array("NAME:Name", "Value:=", "CoilRe_0"))))
oEditor.Unite Array("NAME:Selections", "Selections:=", "CoilRe_0,CoilRe_3" & _
  ",CoilRe_6,CoilRe_9"), Array("NAME:UniteParameters", _
  "CoordinateSystemID:=", -1, "KeepOriginals:=", false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "CoilRe_1,CoilRe_4" & _
  ",CoilRe_7,CoilRe_10"), Array("NAME:UniteParameters", _
  "CoordinateSystemID:=", -1, "KeepOriginals:=", false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "CoilRe_2,CoilRe_5" & _
  ",CoilRe_8,CoilRe_11"), Array("NAME:UniteParameters", _
  "CoordinateSystemID:=", -1, "KeepOriginals:=", false)
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignWindingGroup Array("NAME:PhaseA", "Type:=", "External", _
  "IsSolid:=", false, "Current:=", "0A", "Resistance:=", "0ohm", _
  "Inductance:=", "0H", "Voltage:=", "0V", "ParallelBranchesNum:=", "2")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignWindingGroup Array("NAME:PhaseB", "Type:=", "External", _
  "IsSolid:=", false, "Current:=", "0A", "Resistance:=", "0ohm", _
  "Inductance:=", "0H", "Voltage:=", "0V", "ParallelBranchesNum:=", "2")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignWindingGroup Array("NAME:PhaseC", "Type:=", "External", _
  "IsSolid:=", false, "Current:=", "0A", "Resistance:=", "0ohm", _
  "Inductance:=", "0H", "Voltage:=", "0V", "ParallelBranchesNum:=", "2")
oModule.AssignCoil Array("NAME:PhA_0", "Objects:=", Array("Coil_0"), _
  "Conductor number:=", 15, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhARe_0", "Objects:=", Array("CoilRe_1"), _
  "Conductor number:=", 15, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhB_1", "Objects:=", Array("Coil_1"), _
  "Conductor number:=", 15, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhBRe_1", "Objects:=", Array("CoilRe_2"), _
  "Conductor number:=", 15, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhC_2", "Objects:=", Array("Coil_2"), _
  "Conductor number:=", 15, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhCRe_11", "Objects:=", Array("CoilRe_0"), _
  "Conductor number:=", 15, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseC")
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignLengthOp Array("NAME:Length_Coil", "RefineInside:=", true, _
  "Objects:=", Array("Coil_0", "Coil_1", "Coil_2", "CoilRe_0", "CoilRe_1", _
  "CoilRe_2"), "RestrictElem:=", false, "NumMaxElem:=", "1000", _
  "RestrictLength:=", true, "MaxLength:=", "1.75482mm")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/PMCore", "Version:=", "12.0", "NoOfParameters:=", 13, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "35mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "50mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Poles", "Value:=", "8"), _
  Array("NAME:Pair", "Name:=", "PoleType", "Value:=", "1"), Array("NAME:Pair", _
  "Name:=", "Embrace", "Value:=", "0.7"), Array("NAME:Pair", "Name:=", _
  "ThickMag", "Value:=", "2.5mm"), Array("NAME:Pair", "Name:=", "WidthMag", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Offset", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "Bridge", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "Rib", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "LenRegion", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "InfoCore", _
  "Value:=", "0"))), Array("NAME:Attributes", "Name:=", "Rotor", "Flags:=", _
  "", "Color:=", "(132 132 193)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", _
  "steel_1010_2DSF0.950", "SolveInside:=", true) 
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/PMCore", "Version:=", "12.0", "NoOfParameters:=", 13, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "35mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "50mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Poles", "Value:=", "8"), _
  Array("NAME:Pair", "Name:=", "PoleType", "Value:=", "1"), Array("NAME:Pair", _
  "Name:=", "Embrace", "Value:=", "0.7"), Array("NAME:Pair", "Name:=", _
  "ThickMag", "Value:=", "2.5mm"), Array("NAME:Pair", "Name:=", "WidthMag", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Offset", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "Bridge", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "Rib", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "LenRegion", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "InfoCore", _
  "Value:=", "2"))), Array("NAME:Attributes", "Name:=", "Mag", "Flags:=", "", _
  "Color:=", "(0 255 128)", "Transparency:=", 0, "PartCoordinateSystem:=", _
  "Global", "MaterialName:=", "NdFe35_2DSF1.000_N", "SolveInside:=", true) 
oEditor.DuplicateAroundAxis Array("NAME:Selections", "Selections:=", "Mag"), _
  Array("NAME:DuplicateAroundAxisParameters", "CoordinateSystemID:=", -1, _
  "CreateNewObjects:=", true, "WhichAxis:=", "Z", "AngleStr:=", "45deg", _
  "NumClones:=", "8"), Array("NAME:Options", "DuplicateBoundaries:=", false)
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag"), Array(_
  "NAME:ChangedProps", Array("NAME:Name", "Value:=", "Mag_0"))))
oEditor.Unite Array("NAME:Selections", "Selections:=", "Mag_0,Mag_2,Mag_4,Mag_6"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Mag_1,Mag_3,Mag_5,Mag_7"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_1"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "NdFe35_2DSF1.000_S"))))
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignLengthOp Array("NAME:Length_Mag", "RefineInside:=", true, _
  "Objects:=", Array("Mag_0", "Mag_1"), "RestrictElem:=", false, _
  "NumMaxElem:=", "1000", "RestrictLength:=", true, "MaxLength:=", "1.25mm")
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignTrueSurfOp Array("NAME:SurfApprox_Mag", "Objects:=", Array(_
  "Mag_0", "Mag_1"), "SurfDevChoice:=", 2, "SurfDev:=", "0.0175mm", _
  "NormalDevChoice:=", 2, "NormalDev:=", "15deg", "AspectRatioChoice:=", 1)
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/PMCore", "Version:=", "12.0", "NoOfParameters:=", 13, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "35mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "50mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Poles", "Value:=", "8"), _
  Array("NAME:Pair", "Name:=", "PoleType", "Value:=", "1"), Array("NAME:Pair", _
  "Name:=", "Embrace", "Value:=", "0.7"), Array("NAME:Pair", "Name:=", _
  "ThickMag", "Value:=", "2.5mm"), Array("NAME:Pair", "Name:=", "WidthMag", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Offset", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "Bridge", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "Rib", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "LenRegion", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "InfoCore", _
  "Value:=", "100"))), Array("NAME:Attributes", "Name:=", "InnerRegion", _
  "Flags:=", "", "Color:=", "(0 255 255)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "vacuum", _
  "SolveInside:=", true) 
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignTrueSurfOp Array("NAME:SurfApprox_Main", "Objects:=", Array(_
  "Stator", "Rotor", "Band", "OuterRegion", "InnerRegion", "Shaft"), _
  "SurfDevChoice:=", 2, "SurfDev:=", "0.025mm", "NormalDevChoice:=", 2, _
  "NormalDev:=", "15deg", "AspectRatioChoice:=", 1)
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignLengthOp Array("NAME:Length_Main", "RefineInside:=", true, _
  "Objects:=", Array("Stator", "Rotor", "Band", "OuterRegion", "InnerRegion", _
  "Shaft"), "RestrictElem:=", false, "NumMaxElem:=", "1000", _
  "RestrictLength:=", true, "MaxLength:=", "1.6mm")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Band", _
  "OuterRegion", "InnerRegion"), Array("NAME:ChangedProps", Array(_
  "NAME:Transparent", "Value:=", 0.75))))
oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "Band,InnerRegion" & _
  ",Shaft,Stator,Coil_0,Coil_1,Coil_2,CoilRe_0,CoilRe_1,CoilRe_2,Rotor" & _
  ",Mag_0,Mag_1", "Tool Parts:=", "Tool"), Array(_
  "NAME:SubtractParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.SeparateBody  Array("NAME:Selections", "Selections:=", "Rotor")
oEditor.FitAll
Set oModule = oDesign.GetModule("ModelSetup")
oModule.AssignBand Array("NAME:MotionSetup1", "Move Type:=", "Rotate", _
  "Coordinate System:=", "Global", "Axis:=", "Z", "Is Positive:=", true, _
  "InitPos:=", "7.5deg", "HasRotateLimit:=", false, "NonCylindrical:=", _
  false, "Consider Mechanical Transient:=", true, "Angular Velocity:=", _
  "3730.04rpm", "Moment of Inertia:=", 0.000164018, "Damping:=", 4.14955e-005, _
  "Load Torque:=", "if(speed<205.676, -0.00709208*speed, -300.013/speed)", _
  "Objects:=", Array("Band"))
oModule.EditMotionSetup "MotionSetup1", Array("NAME:Data", _
  "Consider Mechanical Transient:=", false)
Set oModule = oDesign.GetModule("AnalysisSetup")
oModule.InsertSetup "Transient", Array("NAME:Setup1", "StopTime:=", "0.008s", _
  "TimeStep:=", "4e-005s")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.SetMinimumTimeStep "0.0004ms" 
Set oModule = oDesign.GetModule("ReportSetup")
oModule.CreateReport "Torque", "Transient", "XY Plot", "Setup1 : Transient", _
  Array(), Array("Time:=", Array("All")), Array("X Component:=", "Time", _
  "Y Component:=", Array("Moving1.Torque")), Array()
oModule.CreateReport "Winding Currents", "Transient", "XY Plot", _
  "Setup1 : Transient", Array(), Array("Time:=", Array("All")), Array(_
  "X Component:=", "Time", "Y Component:=", Array("Current(PhaseA)", _
  "Current(PhaseB)", "Current(PhaseC)")), Array()
oEditor.ShowWindow
