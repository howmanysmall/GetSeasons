--!optimize 2
--!strict
local function GetWinter(Year: number, YearFloat: number)
	local YearFloatSquared = YearFloat*YearFloat
	local YearFloatCubed = YearFloatSquared*YearFloat

	local Jd0 = 2451900.05952
		+ 365242.74049*YearFloat
		- 0.06223*YearFloatSquared
		- 0.00823*YearFloatCubed
		+ 0.00032*YearFloatCubed*YearFloat

	local Timer = (Jd0 - 2451545)/36525
	local ValueW = math.rad(35999.373*Timer - 2.47)
	local ValueDl = 1 + 0.0334*math.cos(ValueW) + 0.0007*math.cos(2*ValueW)

	return Jd0
		+ (0.00001*(485*math.cos(math.rad(324.96 + 1934.136*Timer)) + 203*math.cos(
			math.rad(337.23 + 32964.467*Timer)
		) + 199*math.cos(math.rad(342.08 + 20.186*Timer)) + 182*math.cos(math.rad(27.85 + 445267.112*Timer)) + 156*math.cos(
			math.rad(73.14 + 45036.886*Timer)
		) + 136*math.cos(math.rad(171.52 + 22518.443*Timer)) + 77*math.cos(math.rad(222.54 + 65928.934*Timer)) + 74*math.cos(
			math.rad(296.72 + 3034.906*Timer)
		) + 70*math.cos(math.rad(243.58 + 9037.513*Timer)) + 58*math.cos(math.rad(119.81 + 33718.147*Timer)) + 52*math.cos(
			math.rad(297.17 + 150.678*Timer)
		) + 50*math.cos(math.rad(21.02 + 2281.226*Timer)) + 45*math.cos(math.rad(247.54 + 29929.562*Timer)) + 44*math.cos(
			math.rad(325.15 + 31555.956*Timer)
		) + 29*math.cos(math.rad(60.93 + 4443.417*Timer)) + 18*math.cos(math.rad(155.12 + 67555.328*Timer)) + 17*math.cos(
			math.rad(288.79 + 4562.452*Timer)
		) + 16*math.cos(math.rad(198.04 + 62894.029*Timer)) + 14*math.cos(math.rad(199.76 + 31436.921*Timer)) + 12*math.cos(
			math.rad(95.39 + 14577.848*Timer)
		) + 12*math.cos(math.rad(287.11 + 31931.756*Timer)) + 12*math.cos(math.rad(320.81 + 34777.259*Timer)) + 9*math.cos(
			math.rad(227.73 + 1222.114*Timer)
		) + 8*math.cos(math.rad(15.45 + 16859.074*Timer))))/ValueDl
		- (66 + (Year - 2000)*1)/86400
end

return GetWinter
