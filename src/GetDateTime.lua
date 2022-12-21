--!optimize 2
--!strict
local function GetDateTime(Jd: number)
	local JdTruncated = math.floor(Jd + 0.5)
	local ValueB = math.floor((JdTruncated - 1867216.25)/36524.25)
	local ValueC = JdTruncated + ValueB - math.floor(ValueB/4) + 1525
	local ValueD = math.floor((ValueC - 122.1)/365.25)
	local ValueE = 365*ValueD + math.floor(ValueD/4)
	local ValueF = math.floor((ValueC - ValueE)/30.6001)

	local Day = math.floor(ValueC - ValueE + 0.5) - math.floor(30.6001*ValueF)
	local Month = ValueF - 1 - 12*math.floor(ValueF/14)
	local Year = ValueD - 4715 - math.floor((7 + Month)/10)
	local Hour = 24*(Jd + 0.5 - JdTruncated)

	local AbsHour = math.abs(Hour)
	local Minute = math.floor(math.round((AbsHour - math.floor(AbsHour))*60))

	if Minute == 60 then
		Minute = 0
		Hour += 1
	end

	return DateTime.fromUniversalTime(Year, Month, Day, Hour, Minute)
end

return GetDateTime
