::ModRngTracker.modthingy.hook("scripts/ui/screens/tactical/modules/topbar/tactical_screen_topbar_event_log", function(q){
	

	q.log_newline = @(__original) {function log_newline(){

		

		
		local i = 1; 
		local stackinfos = getstackinfos(i);
		local boolSkillWasInvolved = false;
		
		do 
		{
			
			if (::MSU.isKindOf(stackinfos.locals["this"], "skill"))
			{
				boolSkillWasInvolved = true;
				if ("r" in stackinfos.locals)
				{
					::ModRngTracker.lastDiceRoll = stackinfos.locals.r;
					break;
				}
			}
			i++;
			stackinfos = getstackinfos(i);
		} 
		while (stackinfos != null);		
		if ((stackinfos == null) && boolSkillWasInvolved) ::logWarning("(RngTracker:) something might have gone wrong; no function of 'skill' with r found.");

		local ret = __original();

		return ret;
	}}.log_newline;

	
});

