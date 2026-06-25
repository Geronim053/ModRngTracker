::ModRngTracker.modthingy.hook("scripts/states/tactical_state", function(q){

	q.onBattleEnded = @(__original) function(){

		::logInfo("(mod_RngTracker:) These are the stats of the battle: ");
		::logInfo("Player: " );
		::logInfo("Number of executed attacks: " + ::ModRngTracker.numberofattacksplayer );
		::logInfo("Average hintchance: " + (::ModRngTracker.expectedsumplayer / ::ModRngTracker.numberofattacksplayer ) );
		::logInfo("Number of expected hits: " + ::ModRngTracker.expectedsumplayer );
		::logInfo("Number of actual hits: " + ::ModRngTracker.successcountplayer );

		::logInfo("AI: " );
		::logInfo("Number of executed attacks: " + ::ModRngTracker.numberofattacksai );
		::logInfo("Average hintchance: " + (::ModRngTracker.expectedsumai / ::ModRngTracker.numberofattacksai ) );
		::logInfo("Number of expected hits: " + ::ModRngTracker.expectedsumai );
		::logInfo("Number of actual hits: " + ::ModRngTracker.successcountai );
		
		::ModRngTracker.successcountplayer = 0;
		::ModRngTracker.successcountai = 0;
		::ModRngTracker.expectedsumplayer = 0;
		::ModRngTracker.expectedsumai = 0;
		::ModRngTracker.numberofattacksplayer = 0;
		::ModRngTracker.numberofattacksai =0;

		local ret = __original();

		return ret;
	};


	


});