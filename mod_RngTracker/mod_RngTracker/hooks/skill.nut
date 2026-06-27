::ModRngTracker.modthingy.hookTree("scripts/skills/skill", function(q){

	q.attackEntity = @(__original) function(_user, _targetEntity, _allowDiversion = true){

		
		local playercontrolled = _user.m.IsControlledByPlayer;

		//////
		
		if (playercontrolled) {
			::ModRngTracker.expectedSumPlayer += this.getHitchance(_targetEntity) / 100.0;
			::ModRngTracker.numberOfAttacksPlayer += 1;
		} else {
			::ModRngTracker.expectedSumAi +=  this.getHitchance(_targetEntity) / 100.0; //this.getHitchance(_targetEntity) / 100;
			::ModRngTracker.numberOfAttacksAi += 1;
		}


		local ret = __original(_user, _targetEntity, _allowDiversion);


		if (playercontrolled) {
			if (ret) ::ModRngTracker.successCountPlayer += 1;
		} else {
			if (ret) ::ModRngTracker.successCountAi += 1;
		}

		return ret;
	};




});


