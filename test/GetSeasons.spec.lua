return function()
	local GetSeasons = require(script.Parent)

	local YEAR_TIMESTAMPS = {
		[2022] = {
			Autumn = 1663895040;
			Spring = 1647790380;
			Summer = 1655802780;
			Winter = 1671659280;
		};

		[2017] = {
			Autumn = 1506110460;
			Spring = 1490005740;
			Summer = 1498019040;
			Winter = 1513873680;
		};

		[1999] = {
			Autumn = 938086320;
			Spring = 921980760;
			Summer = 929994540;
			Winter = 945848640;
		};

		[1970] = {
			Autumn = 22935540;
			Spring = 6829020;
			Summer = 14845380;
			Winter = 30695760;
		};
	}

	describe("GetSeasons", function()
		it("should return the correct timestamp for Autumn", function()
			for Year, Timestamps in YEAR_TIMESTAMPS do
				expect(GetSeasons(Year).Autumn.UnixTimestamp).to.equal(Timestamps.Autumn)
			end
		end)

		it("should return the correct timestamp for Spring", function()
			for Year, Timestamps in YEAR_TIMESTAMPS do
				expect(GetSeasons(Year).Spring.UnixTimestamp).to.equal(Timestamps.Spring)
			end
		end)

		it("should return the correct timestamp for Summer", function()
			for Year, Timestamps in YEAR_TIMESTAMPS do
				expect(GetSeasons(Year).Summer.UnixTimestamp).to.equal(Timestamps.Summer)
			end
		end)

		it("should return the correct timestamp for Winter", function()
			for Year, Timestamps in YEAR_TIMESTAMPS do
				expect(GetSeasons(Year).Winter.UnixTimestamp).to.equal(Timestamps.Winter)
			end
		end)

		it("should throw if it is given an invalid year", function()
			expect(function()
				GetSeasons(1969)
			end).to.throw()
		end)

		it("should throw if it is given an incorrect type", function()
			expect(function()
				GetSeasons("tomorrow")
			end).to.throw()
		end)
	end)
end
