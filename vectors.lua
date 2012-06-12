printf = function ( ... ) print(string.format(...)) end


function vectable( runs )
	local test = {}

	for i = 1, 1024 do
		local x, y, z, w = math.random(), math.random(), math.random(), math.random()
		test[#test+1] = { x = x, y = y, z = z, w = w }
	end

	local start = os.time()

	local total = 0

	for i = 1, runs do
		for j = 1, #test-1 do
			local a, b = test[j], test[j+1]
			local dot = (a.x * b.x) + (a.y * b.y) + (a.z * b.z) + (a.w * b.w)
			total = total + dot
		end
	end

	local finish = os.time()

	printf('table %.2fs total:%f', os.difftime(finish, start), total)
end

function vecarray( runs )
	local test = {}

	for i = 1, 1024 do
		local x, y, z, w = math.random(), math.random(), math.random(), math.random()
		test[#test+1] = { x, y, z, w }
	end

	local start = os.time()

	local total = 0

	for i = 1, runs do
		for j = 1, #test-1 do
			local a, b = test[j], test[j+1]
			local dot = (a[1] * b[1]) + (a[2] * b[2]) + (a[3] * b[3]) + (a[4] * b[4])
			total = total + dot
		end
	end

	local finish = os.time()

	printf('array %.2fs total:%f', os.difftime(finish, start), total)
end


local runs = 3000
printf('#runs:%d', runs)
for i = 1, 5 do
	vectable(runs)
	vecarray(runs)
end