::ModRngTracker <- {
	ID = "mod_RngTracker",
	Name = "ModRngTracker",
	Version = "1.0.1"
}
::ModRngTracker.modthingy <- ::Hooks.register(::ModRngTracker.ID, ::ModRngTracker.Version, ::ModRngTracker.Name);
 
::ModRngTracker.successCountPlayer <- 0;
::ModRngTracker.successCountAi <- 0;
::ModRngTracker.expectedSumPlayer <- 0.0;
::ModRngTracker.expectedSumAi <- 0.0;
::ModRngTracker.numberOfAttacksPlayer <- 0;
::ModRngTracker.numberOfAttacksAi <- 0;
::ModRngTracker.diceRollSumPlayer <- 0;
::ModRngTracker.diceRollSumAi <- 0;
::ModRngTracker.lastDiceRoll <- 0;






::ModRngTracker.modthingy.require("mod_msu");

::ModRngTracker.modthingy.queue(">mod_msu", function(){

	::ModRngTracker.Mod <- ::MSU.Class.Mod(::ModRngTracker.ID, ::ModRngTracker.Version, ::ModRngTracker.Name);
	
	
	::include("mod_RngTracker/hooks/skill");
	::include("mod_RngTracker/hooks/tactical_state");
	::include("mod_RngTracker/hooks/tactical_screen_topbar_event_log");
	::include("mod_RngTracker/helper/helper")
	

}, ::Hooks.QueueBucket.Late);