:- 
  prolog_flag(argv,Argv),
%  write(Argv), nl,
%  append(_,[File],Argv),
  Argv=[File],

  file_base_name(File, BName),
%  write(File), nl,
  %write(BName), nl,
%  halt,
  
  consult(File),
  {diagrams(loader), hook_objects(loader)},
  logtalk_load(BName, [hook(object_wrapper_hook)]), 
  xref_diagram::entity(BName).
:-halt.
