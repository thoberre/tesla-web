module TeslaAPI
  class Vehicle
    def option_code_descriptions
      option_codes.map { |code| codes_to_description.fetch(code, code) }.join(", ")
    end

    def codes_to_description
      {
        "MS01" => "base",
	"MS02" => "base_probably_2013_model",
        "RENA" => "region_us",
        "RECA" => "region_canada",
	"REEU" => "region_europe",
        "TM00" => "standard_trim",
        "TM02" => "signature_trim",
        "DRLH" => "left_hand_drive",
        "DRRH" => "right_hand_drive",
        "PF00" => "no_performance_model",
        "PF01" => "performance_model",
	"PX00" => "no_performance_plus_model",
	"PX01" => "performance_plus_model",
        "BT85" => "battery_85",
        "BT60" => "battery_60",
        "BT40" => "battery_40",
        "PBSB" => "paint_black",
        "PBSW" => "paint_solid_white",
        "PMSS" => "paint_silver",
        "PMTG" => "paint_dolphin_gray_metalic",
        "PMAB" => "paint_metalic_brown",
        "PMMB" => "paint_metalic_blue",
        "PSW"  => "paint_pearl_white",
        "PSR"  => "paint_signature_red",
        "RFBC" => "roof_body_color",
        "RFPO" => "roof_panorama",
        "WT19" => "wheel_silver_19",
        "WT21" => "wheel_silver_21",
        "WTSP" => "wheel_gray_21",
	"WTSG" => "wheel_gray_21_plus",
	"WTSS" => "wheel_silver_21_plus",
        "IBSB" => "seats_base_textile",
        "IZMB" => "seats_black_leather",
        "IZMG" => "seats_gray_leather",
        "IPMB" => "seats_performance_black_leather",
        "IDPB" => "interior_piano_black",
        "IDLW" => "interior_lacewood",
        "IDOM" => "interior_obeche_wood_matte",
        "IDCF" => "interior_carbon_fiber",
        "IPMG" => "interior_performance_leather",
        "TR00" => "no_third_row_seating",
        "TR01" => "third_row_seating",
        "SU00" => "no_air_suspension",
        "SU01" => "air_suspension",
        "SC00" => "no_supercharger",
        "SC01" => "supercharger",
        "AU00" => "no_audio_upgrade",
        "AU01" => "audio_upgrade",
        "CH00" => "no_second_charger",
        "CH01" => "second_charger",
        "HP00" => "no_hpwc_ordered",
        "HP01" => "hpwc_ordered",
        "PA00" => "no_paint_armor",
        "PA01" => "pait_armor",
        "PS00" => "no_parcel_shelf",
        "PS01" => "parcel_shelf",
        "TP00" => "no_tech_package",
        "TP01" => "tech_package",
        "AD02" => "power_adapter_nema_14-50",
        "X001" => "power_lift_gate",
        "X003" => "navigation",
        "X007" => "premium_exterior_lighting",
        "X011" => "homelink",
        "X013" => "satellite_radio",
        "X014" => "standard_radio",
        "X019" => "performance_exterior",
        "X020" => "no_performance_exterior",
        "X024" => "performance_powertrain",
        "X025" => "no_performance_powertrain",
      }
    end
  end
end
