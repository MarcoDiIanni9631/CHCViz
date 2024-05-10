?- consult('/home/marco/Bank_withdraw-user-balance_v2_parsed.pl').
?- {diagrams(loader), hook_objects(loader)}.
?- logtalk_load('Bank_withdraw-user-balance_v2_parsed', [hook(object_wrapper_hook)]), xref_diagram::entity('Bank_withdraw-user-balance_v2_parsed').