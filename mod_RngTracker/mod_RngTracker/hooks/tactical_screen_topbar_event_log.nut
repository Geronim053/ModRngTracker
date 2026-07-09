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
				if (("r" in stackinfos.locals) && ("toHit" in stackinfos.locals) && ("isHit" in stackinfos.locals) && ("_user" in stackinfos.locals) )
				{	
					local playercontrolled = stackinfos.locals._user.isPlayerControlled();

					
					if (playercontrolled) {
						::ModRngTracker.expectedSumPlayer += stackinfos.locals.toHit / 100.0;
						::ModRngTracker.numberOfAttacksPlayer += 1;
						::ModRngTracker.diceRollSumPlayer += stackinfos.locals.r;
						if (stackinfos.locals.isHit) ::ModRngTracker.successCountPlayer += 1;
					} else {
						::ModRngTracker.expectedSumAi +=  this.getHitchance(_targetEntity) / 100.0; 
						::ModRngTracker.numberOfAttacksAi += 1;
						::ModRngTracker.diceRollSumAi += stackinfos.locals.r;
						if (stackinfos.locals.isHit) ::ModRngTracker.successCountAi += 1;

					}

					//::ModRngTracker.lastDiceRoll = stackinfos.locals.r;
					break;
				}
			}
			i++;
			stackinfos = getstackinfos(i);
		} 
		while (stackinfos != null);		
		if ((stackinfos == null) && boolSkillWasInvolved) ::logWarning("(RngTracker:) something might have gone wrong; no function of 'skill' with (r && isHIt && toHit && _user) found.");

		return = __original();

		
	}}.log_newline;

	
});

