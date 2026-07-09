::ModRngTrackerMV <- {
	ID = "mod_RngTrackerMV",
	Name = "ModRngTrackerMV",
	Version = "1.0.4"
}
::ModRngTrackerMV.modthingy <- ::Hooks.register(::ModRngTrackerMV.ID, ::ModRngTrackerMV.Version, ::ModRngTrackerMV.Name);
 
::ModRngTrackerMV.successCountPlayer <- 0;
::ModRngTrackerMV.successCountAi <- 0;
::ModRngTrackerMV.expectedSumPlayer <- 0.0;
::ModRngTrackerMV.expectedSumAi <- 0.0;
::ModRngTrackerMV.numberOfAttacksPlayer <- 0;
::ModRngTrackerMV.numberOfAttacksAi <- 0;
::ModRngTrackerMV.diceRollSumPlayer <- 0;
::ModRngTrackerMV.diceRollSumAi <- 0;







::ModRngTrackerMV.modthingy.require("mod_msu", "mod_modular_vanilla");

::ModRngTrackerMV.modthingy.queue(">mod_msu", "mod_modular_vanilla", function(){

	::ModRngTrackerMV.Mod <- ::MSU.Class.Mod(::ModRngTrackerMV.ID, ::ModRngTrackerMV.Version, ::ModRngTrackerMV.Name);
	
	
	::include("mod_RngTracker/hooks/skill");
	::include("mod_RngTracker/hooks/tactical_state");
	
	

}, ::Hooks.QueueBucket.Late);