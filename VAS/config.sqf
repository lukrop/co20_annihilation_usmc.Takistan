//Allow player to respawn with his loadout? If true unit will respawn with all ammo from initial save! Set to false to disable this and rely on other scripts!
vas_onRespawn = true;
//Preload Weapon Config?
vas_preload = true;
//If limiting weapons its probably best to set this to true so people aren't loading custom loadouts with restricted gear.
vas_disableLoadSave = false;
//Amount of save/load slots
vas_customslots = 49; //9 is actually 10 slots, starts from 0 to whatever you set, so always remember when setting a number to minus by 1, i.e 12 will be 11.
//Disable 'VAS hasn't finished loading' Check !!! ONLY RECOMMENDED FOR THOSE THAT USE ACRE AND OTHER LARGE ADDONS !!!
vas_disableSafetyCheck = false;
/*
	NOTES ON EDITING!
	YOU MUST PUT VALID CLASS NAMES IN THE VARIABLES IN AN ARRAY FORMAT, NOT DOING SO WILL RESULT IN BREAKING THE SYSTEM!
	PLACE THE CLASS NAMES OF GUNS/ITEMS/MAGAZINES/BACKPACKS/GOGGLES IN THE CORRECT ARRAYS! TO DISABLE A SELECTION I.E
	GOGGLES vas_goggles = [""]; AND THAT WILL DISABLE THE ITEM SELECTION FOR WHATEVER VARIABLE YOU ARE WANTING TO DISABLE!

														EXAMPLE
	vas_weapons = ["srifle_EBR_ARCO_point_grip_F","arifle_Khaybar_Holo_mzls_F","arifle_TRG21_GL_F","Binocular"];
	vas_magazines = ["30Rnd_65x39_case_mag","20Rnd_762x45_Mag","30Rnd_65x39_caseless_green"];
	vas_items = ["ItemMap","ItemGPS","NVGoggles"];
	vas_backpacks = ["B_Bergen_sgg_Exp","B_AssaultPack_rgr_Medic"];
	vas_goggles = [""];

												Example for side specific (TvT)
	switch(playerSide) do
	{
		//Blufor
		case west:
		{
			vas_weapons = ["srifle_EBR_F","arifle_MX_GL_F"];
			vas_items = ["muzzle_snds_H","muzzle_snds_B","muzzle_snds_L","muzzle_snds_H_MG"]; //Removes suppressors from VAS
			vas_goggles = ["G_Diving"]; //Remove diving goggles from VAS
		};
		//Opfor
		case west:
		{
			vas_weapons = ["srifle_EBR_F","arifle_MX_GL_F"];
			vas_items = ["muzzle_snds_H","muzzle_snds_B","muzzle_snds_L","muzzle_snds_H_MG"]; //Removes suppressors from VAS
			vas_goggles = ["G_Diving"]; //Remove diving goggles from VAS
		};
	};
*/

//If the arrays below are empty (as they are now) all weapons, magazines, items, backpacks and goggles will be available
//Want to limit VAS to specific weapons? Place the classnames in the array!
vas_weapons = [];
//Want to limit VAS to specific magazines? Place the classnames in the array!
vas_magazines = [];
//Want to limit VAS to specific items? Place the classnames in the array!
vas_items = [];
//Want to limit backpacks? Place the classnames in the array!
vas_backpacks = [];
//Want to limit goggles? Place the classnames in the array!
vas_glasses = [];


/*
	NOTES ON EDITING:
	THIS IS THE SAME AS THE ABOVE VARIABLES, YOU NEED TO KNOW THE CLASS NAME OF THE ITEM YOU ARE RESTRICTING. THIS DOES NOT WORK IN
	CONJUNCTION WITH THE ABOVE METHOD, THIs IS ONLY FOR RESTRICTING / LIMITING ITEMS FROM VAS AND NOTHING MORE

														EXAMPLE
	vas_r_weapons = ["srifle_EBR_F","arifle_MX_GL_F"];
	vas_r_items = ["muzzle_snds_H","muzzle_snds_B","muzzle_snds_L","muzzle_snds_H_MG"]; //Removes suppressors from VAS
	vas_r_goggles = ["G_Diving"]; //Remove diving goggles from VAS

												Example for side specific (TvT)
	switch(playerSide) do
	{
		//Blufor
		case west:
		{
			vas_r_weapons = ["srifle_EBR_F","arifle_MX_GL_F"];
			vas_r_items = ["muzzle_snds_H","muzzle_snds_B","muzzle_snds_L","muzzle_snds_H_MG"]; //Removes suppressors from VAS
			vas_r_goggles = ["G_Diving"]; //Remove diving goggles from VAS
		};
		//Opfor
		case west:
		{
			vas_r_weapons = ["srifle_EBR_F","arifle_MX_GL_F"];
			vas_r_items = ["muzzle_snds_H","muzzle_snds_B","muzzle_snds_L","muzzle_snds_H_MG"]; //Removes suppressors from VAS
			vas_r_goggles = ["G_Diving"]; //Remove diving goggles from VAS
		};
	};
*/

//Below are variables you can use to restrict certain items from being used.
//Remove Weapon

vas_r_weapons = ["arifle_mas_ak_74m_sf_h","arifle_mas_ak_74m_sf_a","arifle_mas_ak_74m_sf_e","arifle_mas_ak_74m_sf_sd","arifle_mas_ak_74m_sf_gl_h","arifle_mas_ak_74m_sf_gl_a","arifle_mas_ak_74m_sf_gl_e","arifle_mas_ak_74m_sf_gl_sd","arifle_mas_ak_74m_sf_c_h","arifle_mas_ak_74m_sf_c_a","arifle_mas_ak_74m_sf_c_e","arifle_mas_ak_74m_sf_c_sd","arifle_mas_ak_74m_sf_gl_c_h","arifle_mas_ak_74m_sf_gl_c_a","arifle_mas_ak_74m_sf_gl_c_e","arifle_mas_ak_74m_sf_gl_c_sd","arifle_mas_ak_74m_h","arifle_mas_ak_74m_ti","arifle_mas_ak_74m_a","arifle_mas_ak_74m_gl_h","arifle_mas_ak_74m_gl_ti","arifle_mas_ak_74m_gl_a","arifle_mas_ak_74m_gl_sd","arifle_mas_ak_74m_c_h","arifle_mas_ak_74m_c_ti","arifle_mas_ak_74m_c_a","arifle_mas_ak_74m_c_sd","arifle_mas_ak_74m_gl_c_h","arifle_mas_ak_74m_gl_c_ti","arifle_mas_ak_74m_gl_c_a","arifle_mas_ak_74m_gl_c_sd","arifle_mas_ak_74m_sd","arifle_mas_bizon_h","arifle_mas_bizon_a","arifle_mas_bizon_sd","arifle_mas_m4_t","arifle_mas_m4_ti","arifle_mas_m4_h","arifle_mas_m4_a","arifle_mas_m4_e","arifle_mas_m4_sd","arifle_mas_m4_gl_t","arifle_mas_m4_gl_ti","arifle_mas_m4_gl_h","arifle_mas_m4_gl_a","arifle_mas_m4_gl_e","arifle_mas_m4_gl_sd","arifle_mas_m4_m203_t","arifle_mas_m4_m203_ti","arifle_mas_m4_m203_h","arifle_mas_m4_m203_a","arifle_mas_m4_m203_e","arifle_mas_m4_m203_sd","arifle_mas_m4_v_t","arifle_mas_m4_v_ti","arifle_mas_m4_v_h","arifle_mas_m4_v_a","arifle_mas_m4_v_e","arifle_mas_m4_v_sd","arifle_mas_m4_gl_v_t","arifle_mas_m4_gl_v_ti","arifle_mas_m4_gl_v_h","arifle_mas_m4_gl_v_a","arifle_mas_m4_gl_v_e","arifle_mas_m4_gl_v_sd","arifle_mas_m4_m203_v_t","arifle_mas_m4_m203_v_ti","arifle_mas_m4_m203_v_h","arifle_mas_m4_m203_v_a","arifle_mas_m4_m203_v_e","arifle_mas_m4_m203_v_sd","arifle_mas_m4_d_t","arifle_mas_m4_d_ti","arifle_mas_m4_d_h","arifle_mas_m4_d_a","arifle_mas_m4_d_e","arifle_mas_m4_d_sd","arifle_mas_m4_gl_d_t","arifle_mas_m4_gl_d_ti","arifle_mas_m4_gl_d_h","arifle_mas_m4_gl_d_a","arifle_mas_m4_gl_d_e","arifle_mas_m4_gl_d_sd","arifle_mas_m4_m203_d_t","arifle_mas_m4_m203_d_ti","arifle_mas_m4_m203_d_h","arifle_mas_m4_m203_d_a","arifle_mas_m4_m203_d_e","arifle_mas_m4_m203_d_sd","arifle_mas_m4c_h","arifle_mas_m4c_e","arifle_mas_m4c_sd","arifle_mas_m4_m203c","arifle_mas_m4_m203c_h","arifle_mas_m4_m203c_e","arifle_mas_m4_m203c_sd","arifle_mas_m4c_v_h","arifle_mas_m4c_v_e","arifle_mas_m4c_v_sd","arifle_mas_m4_m203c_v","arifle_mas_m4_m203c_v_h","arifle_mas_m4_m203c_v_e","arifle_mas_m4_m203c_v_sd","arifle_mas_m4c_d_h","arifle_mas_m4c_d_e","arifle_mas_m4c_d_sd","arifle_mas_m4_m203c_d","arifle_mas_m4_m203c_d_h","arifle_mas_m4_m203c_d_e","arifle_mas_m4_m203c_d_sd","arifle_mas_hk416_t","arifle_mas_hk416_h","arifle_mas_hk416_a","arifle_mas_hk416_e","arifle_mas_hk416_sd","arifle_mas_hk416_gl_t","arifle_mas_hk416_gl_h","arifle_mas_hk416_gl_a","arifle_mas_hk416_gl_e","arifle_mas_hk416_gl_sd","arifle_mas_hk416_m203_t","arife_mas_hk416_m203_h","arifle_mas_hk416_m203_a","arifle_mas_hk416_m203_e","arifle_mas_hk416_m203_sd","arifle_mas_hk416_v_t","arifle_mas_hk416_v_h","arifle_mas_hk416_v_a","arifle_mas_hk416_v_e","arifle_mas_hk416_v_sd","arifle_mas_hk416_gl_v_t","arifle_mas_hk416_gl_v_h","arifle_mas_hk416_gl_v_a","arifle_mas_hk416_gl_v_e","arifle_mas_hk416_gl_v_sd","arifle_mas_hk416_m203_v_t","arifle_mas_hk416_m203_v_h","arifle_mas_hk416_m203_v_a","arifle_mas_hk416_m203_v_e","arifle_mas_hk416_m203_v_sd","arifle_mas_hk416_d_t","arifle_mas_hk416_d_h","arifle_mas_hk416_d_a","arifle_mas_hk416_d_e","arifle_mas_hk416_d_sd","arifle_mas_hk416_gl_d_t","arifle_mas_hk416_gl_d_h","arifle_mas_hk416_gl_d_a","arifle_mas_hk416_gl_d_e","arifle_mas_hk416_gl_d_sd","arifle_mas_hk416_m203_d_t","arifle_mas_hk416_m203_d_h","arifle_mas_hk416_m203_d_a","arifle_mas_hk416_m203_d_e","arifle_mas_hk416_m203_d_sd","arifle_mas_hk416c_h","arifle_mas_hk416c_e","arifle_mas_hk416c_sd","arifle_mas_hk416_m203c_h","arifle_mas_hk416_m203c_e","arifle_mas_hk416_m203c_sd","arifle_mas_hk416c_v_h","arifle_mas_hk416c_v_e","arifle_mas_hk416c_v_sd","arifle_mas_hk416_m203c_v_h","arifle_mas_hk416_m203c_v_e","arifle_mas_hk416_m203c_v_sd","arifle_mas_hk416c_d_h","arifle_mas_hk416c_d_e","arifle_mas_hk416c_d_sd","arifle_mas_hk416_m203c_d_h","arifle_mas_hk416_m203c_d_e","arifle_mas_hk416_m203c_d_sd","arifle_mas_hk417c_h","arifle_mas_hk417c_e","arifle_mas_hk417c_sd","arifle_mas_hk417_m203c_h","arifle_mas_hk417_m203c_e","arifle_mas_hk417_m203c_sd","arifle_mas_hk417c_v_h","arifle_mas_hk417c_v_e","arifle_mas_hk417c_v_sd","arifle_mas_hk417_m203c_v_h","arifle_mas_hk417_m203c_v_e","arifle_mas_hk417_m203c_v_sd","arifle_mas_hk417c_d_h","arifle_mas_hk417c_d_e","arifle_mas_hk417c_d_sd","arifle_mas_hk417_m203c_d_h","arifle_mas_hk417_m203c_d_e","arifle_mas_hk417_m203c_d_sd","arifle_mas_m16_mh","arifle_mas_m16_mt","arifle_mas_m16_a","arifle_mas_m16_e","arifle_mas_m16_sd","arifle_mas_m16_gl_mt","arifle_mas_m16_gl_mh","arifle_mas_m16_mti","arifle_mas_m16_gl_mti","arifle_mas_m16_t","arifle_mas_m16_gl_t","arifle_mas_m16_gl_a","arifle_mas_m16_gl_e","arifle_mas_m16_gl_sd","arifle_mas_g3_h","arifle_mas_g3_a","arifle_mas_g3_m203_h","arifle_mas_g3_m203_a","arifle_mas_g3s_h","arifle_mas_g3s_a","arifle_mas_g3s_m203_h","arifle_mas_g3s_m203_a","srifle_mas_hk417_h","srifle_mas_hk417_sd","srifle_mas_hk417_v_h","srifle_mas_hk417_v_sd","srifle_mas_hk417_d_h","srifle_mas_hk417_d_sd","srifle_mas_sr25_h","srifle_mas_sr25_sd","srifle_mas_sr25_v_h","srifle_mas_sr25_v_sd","srifle_mas_sr25_d_h","srifle_mas_sr25_d_sd","srifle_mas_ebr","srifle_mas_ebr_a","srifle_mas_ebr_t","srifle_mas_ebr_h","srifle_mas_ebr_sd","srifle_mas_m24_h","srifle_mas_m24_v_h","srifle_mas_m24_d_h","srifle_mas_m107_h","srifle_mas_m107_v_h","srifle_mas_m107_v_sd","srifle_mas_m107_sd","srifle_mas_m107_d_h","srifle_mas_m107_d_sd","arifle_mas_mp5_a","arifle_mas_mp5_e","arifle_mas_mp5_sd","arifle_mas_mp5_v_a","arifle_mas_mp5_v_e","arifle_mas_mp5_v_sd","arifle_mas_mp5_d_a","arifle_mas_mp5_d_e","arifle_mas_mp5_d_sd","arifle_mas_mp5sd_a","arifle_mas_mp5sd_e","LMG_mas_Mk200_F","LMG_mas_Mk200_F_t","LMG_mas_Mk200_F_h","LMG_mas_Mk200_F_a","LMG_mas_Mk200_F_sd","LMG_mas_M249_F_t","LMG_mas_M249_F_h","LMG_mas_M249_F_a","LMG_mas_M249_F_sd","LMG_mas_M249_F_v_t","LMG_mas_M249_F_v_h","LMG_mas_M249_F_v_a","LMG_mas_M249_F_v_sd","LMG_mas_M249_F_d_t","LMG_mas_M249_F_d_h","LMG_mas_M249_F_d_a","LMG_mas_M249_F_d_sd","LMG_mas_M249a_F_t","LMG_mas_M249a_F_a","LMG_mas_mk48_F_t","LMG_mas_mk48_F_h","LMG_mas_mk48_F_a","LMG_mas_mk48_F_v_t","LMG_mas_mk48_F_v_h","LMG_mas_mk48_F_v_a","LMG_mas_mk48_F_d_t","LMG_mas_Mk48_F_d_h","LMG_mas_mk48_F_d_a","LMG_mas_m240_F_h","LMG_mas_m240_F_a","LMG_mas_mg3_F_h","hgun_mas_m9_F_sd","hgun_mas_bhp_F_sd","hgun_mas_glock_F_sd","hgun_mas_acp_F_sd","hgun_mas_glocksf_F_sd","hgun_mas_usp_F_sd","hgun_mas_usp_l_F","hgun_mas_usp_l_F_sd","arifle_mas_ak_74m_h","arifle_mas_ak_74m_ti","arifle_mas_ak_74m_a","arifle_mas_ak_74m_sd","arifle_mas_ak_74m_gl_h","arifle_mas_ak_74m_gl_ti","arifle_mas_ak_74m_gl_a","arifle_mas_ak_74m_gl_sd","arifle_mas_ak_74m_c_h","arifle_mas_ak_74m_c_ti","arifle_mas_ak_74m_c_a","arifle_mas_ak_74m_c_sd","arifle_mas_ak_74m_gl_c_h","arifle_mas_ak_74m_gl_c_ti","arifle_mas_ak_74m_gl_c_a","arifle_mas_ak_74m_gl_c_sd","arifle_mas_aks74_h","arifle_mas_aks74_a","arifle_mas_aks74_gl_h","arifle_mas_aks74_gl_a","arifle_mas_akms_h","arifle_mas_akms_a","arifle_mas_akms_sd","arifle_mas_akms_gl_h","arifle_mas_akms_gl_a","arifle_mas_akms_gl_sd","arifle_mas_akms_c_h","arifle_mas_akms_c_a","arifle_mas_akms_c_sd","arifle_mas_akms_gl_c_h","arifle_mas_akms_gl_c_a","arifle_mas_akms_gl_c_sd","arifle_mas_akm_h","arifle_mas_akm_a","arifle_mas_akm_gl_h","arifle_mas_akm_gl_a","arifle_mas_aks74u_h","arifle_mas_aks74u_a","arifle_mas_aks74u_sd","arifle_mas_aks74u_c_h","arifle_mas_aks74u_c_a","arifle_mas_aks74u_c_sd","srifle_mas_svd_h","srifle_mas_svd_sd","srifle_mas_svd_l","srifle_mas_ksvk_h","srifle_mas_ksvk_sd","srifle_mas_ksvk_c_h","srifle_mas_ksvk_c_sd","LMG_mas_rpk_F_h","LMG_mas_rpk_F_a","LMG_mas_rpk_F_sd","LMG_mas_pkm_F_h","LMG_mas_pkm_F_a","srifle_mas_m91_l","hgun_mas_mak_F_sd","launch_mas_sting_F", "arifle_mas_hk416_m203_h", "arifle_mas_fal_h", "arifle_mas_fal_a", "arifle_mas_fal_m203_h", "arifle_mas_fal_m203_a","hgun_mas_m9_F_sd", "hgun_mas_bhp_F_sd", "hgun_mas_glock_F_sd", "hgun_mas_m23_F_sd", "hgun_mas_m23_l_F_sd", "hgun_mas_glock_F", "hgun_mas_glocksf_F", "hgun_mas_m23_l_F", "hgun_mas_acp_F_sd", "hgun_mas_usp_l_F", "hgun_mas_glocksf_F_sd", "hgun_mas_usp_F_sd", "hgun_mas_usp_l_F_sd", "hgun_mas_mak_F_sd",
    "caf_AK47", "caf_AK74", "caf_ak74gl", "caf_pkm", "caf_rpg7", "caf_rpk74", "caf_svd", "caf_Strela"
    ];


vas_r_backpacks = [];
//Magazines to remove from VAS
vas_r_magazines = ["CAF_100Rnd_762x54_PKM", "caf_10Rnd_762x54_SVD", "CAF_30Rnd_545x39_AK", "CAF_30Rnd_762x39_AK",
	"CAF_75rnd_545x39_RPK", "caf_AA_rocket", "caf_OG7", "caf_PG7V"];
//Items to remove from VAS
vas_r_items = ["muzzle_snds_H","muzzle_snds_B","muzzle_snds_L","muzzle_snds_H_MG"];
//Goggles to remove from VAS
vas_r_glasses = [];
