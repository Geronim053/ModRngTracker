::ModRngTrackerMV.modthingy.hookTree("scripts/skills/skill", function(q){

	q.MV_onAttackRolled = @(__original) { function MV_onAttackRolled(_attackInfo){
		
		local ret = __original(_attackInfo);

		

		if (_attackInfo.User.isPlayerControlled()) {
			::ModRngTrackerMV.expectedSumPlayer += _attackInfo.ChanceToHit / 100.0;
			::ModRngTrackerMV.numberOfAttacksPlayer += 1;
			::ModRngTrackerMV.diceRollSumPlayer += _attackInfo.Roll;
		} else {
			::ModRngTrackerMV.expectedSumAi +=  _attackInfo.ChanceToHit / 100.0; 
			::ModRngTrackerMV.numberOfAttacksAi += 1;
			::ModRngTrackerMV.diceRollSumAi += _attackInfo.Roll;
		}

		return ret;

	
	}}.MV_onAttackRolled;

	q.MV_onAttackEntityHit = @(__original) { function MV_onAttackEntityHit( _attackInfo ) {

		if (_attackInfo.User.isPlayerControlled()) {
			
			::ModRngTrackerMV.successCountPlayer += 1;
			
		} else {
			
			::ModRngTrackerMV.successCountAi += 1;
		}

		return __original(_attackInfo);

	}}.MV_onAttackEntityHit;

});


