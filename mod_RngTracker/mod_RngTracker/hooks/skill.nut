::ModRngTracker.modthingy.hookTree("scripts/skills/skill", function(q){

	q.attackEntity = @(__original) {function attackEntity(_user, _targetEntity, _allowDiversion = true){

		
		local playercontrolled = _user.isPlayerControlled();

		//////
		
		if (playercontrolled) {
			::ModRngTracker.expectedSumPlayer += this.getHitchance(_targetEntity) / 100.0;
			::ModRngTracker.numberOfAttacksPlayer += 1;
		} else {
			::ModRngTracker.expectedSumAi +=  this.getHitchance(_targetEntity) / 100.0; 
			::ModRngTracker.numberOfAttacksAi += 1;
		}


		local ret = __original(_user, _targetEntity, _allowDiversion);


		if (playercontrolled) {
			if (ret) ::ModRngTracker.successCountPlayer += 1;
			::ModRngTracker.diceRollSumPlayer += ::ModRngTracker.lastDiceRoll;
		} else {
			if (ret) ::ModRngTracker.successCountAi += 1;
			::ModRngTracker.diceRollSumAi += ::ModRngTracker.lastDiceRoll;
		}

		return ret;
	}}.attackEntity;


	q.onScheduledTargetHit = @(__original) { (_info ){	//r-fetch in case of hit


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

		return __original(_info);

	}}.onScheduledTargetHit;
});


