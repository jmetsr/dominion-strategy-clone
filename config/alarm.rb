def alarm(hour, min)
	wake_up_time = false
	while true
		if (Time.now.min == min) && (Time.now.hour == hour)
			wake_up_time = true
		end
		if wake_up_time
			system('say "wake up"')
		end
	end
end


def shabbas_alarm(hour,min)
wake_up_time = false
	while true
		if (Time.now.min == min) && (Time.now.hour == hour)
			wake_up_time = true
		end
		if wake_up_time && time.now.hour == hour
			system('say "wake up"')
		end
	end
end
alarm(8,20)