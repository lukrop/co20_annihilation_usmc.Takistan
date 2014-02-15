class lkr
{
	tag = "lkr";
	class functions
	{
		file = "lkr\functions";
		class ICE_vehRespawn {};
		class initMHQ {};
		class gcInit {postInit=1}; // starts the garbage collector
		class gcMonitor {};
		class gcAdd {};
		class gcEmptyQueue {};
		class gcDeleteFirstInQueue {};
	};
};
