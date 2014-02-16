class lkr
{
	tag = "lkr";
	class ext {
		file = "lkr\ext";
		
		class ICE_vehRespawn {};
	};

	class common {
		file = "lkr\common";
		
		class loadConfig {preInit=1};
		class initMHQ {};
		class spawnEnemyGroup {};
		class enableGarbageCollection{};
		class groupExecuteTask{};
	};

	class gc
	{
		file = "lkr\gc";

		class gcInit {postInit=1}; // starts the garbage collector
		class gcMonitor {};
		class gcAdd {};
		class gcEmptyQueue {};
		class gcDeleteFirstInQueue {};
	};

	class mm
	{
		file = "lkr\mm";

		class mmInit {postInit=1}; // starts the mission manager
		class mmLoop {};
		class mmChooseMission {};
		class mmRunMission {};
	};
	
};
