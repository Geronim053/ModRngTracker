::ModRngTracker.modthingy.hook("scripts/entity/tactical/actor", function(q){
	

	q.onMissed = @(__original) {function onMissed(( _attacker, _skill, _dontShake = false )){	//r-fetch in case of miss

		

		
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

		return __original( _attacker, _skill, _dontShake = false );


	}}.onMissed;

	
});