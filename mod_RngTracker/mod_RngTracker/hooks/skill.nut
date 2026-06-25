::ModRngTracker.modthingy.hookTree("scripts/skills/skill", function(q){

	q.attackEntity = @(__original) function(_user, _targetEntity, _allowDiversion = true){

		
		local playercontrolled = _user.m.IsControlledByPlayer;

		if (playercontrolled) {
			::ModRngTracker.expectedsumplayer += this.getHitchance(_targetEntity) / 100;
			::logInfo("fetched hitchance: " +  this.getHitchance(_targetEntity) / 100);
			::logInfo("new expectedPlayer: " +  ::ModRngTracker.expectedsumplayer);
			::ModRngTracker.numberofattacksplayer += 1;
		} else {
			::ModRngTracker.expectedsumai += this.getHitchance(_targetEntity) / 100;
			::ModRngTracker.numberofattacksai += 1;
		}


		local ret = __original(_user, _targetEntity, _allowDiversion);


		if (playercontrolled) {
			if (ret) ::ModRngTracker.successcountplayer += 1;
		} else {
			if (ret) ::ModRngTracker.successcountai += 1;
		}

		return ret;
	};




});