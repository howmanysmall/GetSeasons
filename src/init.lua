--!optimize 2
--!strict
local GetAutumn = require(script:FindFirstChild("GetAutumn"))
local GetSpring = require(script:FindFirstChild("GetSpring"))
local GetSummer = require(script:FindFirstChild("GetSummer"))
local GetWinter = require(script:FindFirstChild("GetWinter"))

local GetDateTime = require(script:FindFirstChild("GetDateTime"))

export type ISeasons = {
	Autumn: DateTime,
	Spring: DateTime,
	Summer: DateTime,
	Winter: DateTime,
}

local function GetSeasons(Year: number)
	if type(Year) ~= "number" then
		error(string.format("Invalid argument #1 to 'GetSeasons' (expected number, got %*)", typeof(Year)), 2)
	end

	if Year < 1970 then
		error(string.format("Invalid argument #1 to 'GetSeasons' (expected year >= 1970, got %*)", Year), 2)
	end

	local YearFloat = (Year - 2000)/1000
	return table.freeze({
		Autumn = GetDateTime(GetAutumn(Year, YearFloat));
		Spring = GetDateTime(GetSpring(Year, YearFloat));
		Summer = GetDateTime(GetSummer(Year, YearFloat));
		Winter = GetDateTime(GetWinter(Year, YearFloat));
	})
end

return GetSeasons
