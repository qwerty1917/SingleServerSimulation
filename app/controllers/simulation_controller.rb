# class ma
#   def initialize(number)
#     @number = number
#   end
# end

PART_NUM = 0
TIME = 1
EVENT = 2

class Part
  def initialize(part_num, arrival_time)
    @part_num = part_num
    @arrival_time = arrival_time
  end
  
  def get_part_num
    @part_num
  end
  
  def get_arrival_time
    @arrival_time
  end
end


class State
  # class 수정: 아마도 getter/setter 해줘야 하는듯;;
  def initialize
    @machine = 0
    @queue = Array.new
    @clock = 0.0
    @b_t = 0
    @q_t = 0
    
    #arrival times of custs. in queue 
    @ATofCinQ = Array.new
    @event_calender = Array.new
    
    #number of completed waiting times in queue
    @NofCWTinQ = 0
    
    # #total of waiting times in queue
    @TofWTinQ = 0.00
    @Area_und_q_t = 0.00
    @Area_und_b_t = 0.00
    @IAT_arr_bar = Array.new
    @ST_arr_bar = Array.new
    @IAT_arr = Array.new
    @ST_arr = Array.new
    @last_tick = 0
    @terminate = false
    @q_t_data_list = []
    @b_t_data_list = []
    @completed = 0
    @max_waiting_time = 0
    @max_num_in_queue = 0
  end
  
  
  # @machine
  def set_machine(machine_state)
    if @machine != 0
      push_b_t_data_list([@clock, 1])
    else
      push_b_t_data_list([@clock, 0])
    end
    
    @machine = machine_state
    if @machine != 0
      push_b_t_data_list([@clock, 1])
    else
      push_b_t_data_list([@clock, 0])
    end
  end
  
  def get_machine
    Marshal.load( Marshal.dump(@machine))
  end
  
  
  # @queue
  def set_queue(queue_list)
    push_q_t_data_list([@clock, get_queue.length])
    if @max_num_in_queue < queue_list.length
      @max_num_in_queue = queue_list.length
    end
    @queue = queue_list
    push_q_t_data_list([@clock, @queue.length])
  end
  
  def get_queue
    Marshal.load( Marshal.dump(@queue))
  end


  # @clock
  def set_clock(clock)
    @clock = clock
  end
  
  def get_clock
    @clock
  end
  
  
  # @b_t
  def set_b_t(b_t)
    @b_t = b_t
  end
  
  def get_b_t
    @b_t
  end
  
    
  # @q_t
  def set_q_t(q_t)
    @q_t = q_t
  end
  
  def get_q_t
    @q_t
  end
  
  
  # @ATofCinQ
  def set_ATofCinQ(_ATofCinQ)
    @ATofCinQ = _ATofCinQ
  end
  
  def get_ATofCinQ
    @ATofCinQ
  end
  

  # @event_calender
  def set_event_calender(event_calender)
    new_cal = []
    for event in event_calender
      new_event = event
      new_event[TIME] = event[TIME].round(2)
      new_cal.push(new_event)
    end
    @event_calender = new_cal
  end
  
  def get_event_calender
    @event_calender
  end
  
  
  # @NofCWTinQ
  def set_NofCWTinQ(_NofCWTinQ)
    @NofCWTinQ = _NofCWTinQ
  end
  
  def get_NofCWTinQ
    @NofCWTinQ
  end
  
  
  # @TofWTinQ
  def set_TofWTinQ(_TofWTinQ)
    @TofWTinQ = _TofWTinQ
  end
  
  def get_TofWTinQ
    @TofWTinQ
  end
  
  
  # @Area_und_q_t
  def set_Area_und_q_t(_Area_und_q_t)
    @Area_und_q_t = _Area_und_q_t
  end
  
  def get_Area_und_q_t
    @Area_und_q_t
  end
  
  
  # @Area_und_b_t
  def set_Area_und_b_t(_Area_und_b_t)
    @Area_und_b_t = _Area_und_b_t
  end
  
  def get_Area_und_b_t
    @Area_und_b_t
  end
  
  
  # @IAT_arr_bar
  def set_IAT_arr_bar(_IAT_arr_bar)
    @IAT_arr_bar = _IAT_arr_bar
  end
  
  def get_IAT_arr_bar
    @IAT_arr_bar
  end
  

  # @ST_arr_bar
  def set_ST_arr_bar(_ST_arr_bar)
    @ST_arr_bar = _ST_arr_bar
  end
  
  def get_ST_arr_bar
    @ST_arr_bar
  end
  
  
  # @IAT_arr
  def set_IAT_arr(_IAT_arr)
    @IAT_arr = _IAT_arr
  end
  
  def get_IAT_arr
    @IAT_arr
  end
  
  
  # @ST_arr
  def set_ST_arr(_ST_arr)
    @ST_arr = _ST_arr
  end
  
  def get_ST_arr
    @ST_arr
  end
  
  
  # @last_tick
  def set_last_tick(last_tick)
    @last_tick = last_tick
  end
  
  def get_last_tick
    @last_tick
  end
  
  
  # @terminate
  def set_terminate(terminate)
    @terminate = terminate
  end
  
  def get_terminate()
    @terminate
  end
  
  
  # @q_t_data_list
  def set_q_t_data_list(q_t_data_list)
    @q_t_data_list = q_t_data_list
  end
  
  def get_q_t_data_list
    @q_t_data_list
  end
  
  def push_q_t_data_list(point)
    @q_t_data_list.push(point)
  end
  
  
  # @b_t_data_list
  def set_b_t_data_list(b_t_data_list)
    @b_t_data_list = b_t_data_list
  end
  
  def get_b_t_data_list
    @b_t_data_list
  end
  
  def push_b_t_data_list(point)
    @b_t_data_list.push(point)
  end
  
  
  # @completed
  def set_completed(completed)
    @completed = completed
  end
  
  def get_completed
    @completed
  end
  
  def add_completed
    @completed += 1
  end
  
  
  # @max_waiting_time
  def set_max_waiting_time(max_waiting_time)
    @max_waiting_time = max_waiting_time
  end
  
  def get_max_waiting_time
    @max_waiting_time
  end
  
  
  # @max_num_in_queue
  def get_max_num_in_queue
    @max_num_in_queue
  end
  
end


class SimulationController < ApplicationController
  
  def intro
    @page_title = 'SIM'
  end

  def schedule_input
    @page_title = 'SIM'
  end
  
  def add_schedule
    schedule = Schedule.new
    schedule.name = params[:name]
    schedule.IAT = params[:IAT]
    schedule.ST = params[:ST]
    schedule.save
    redirect_to action: "schedule_list"
  end
  
  def del_schedule
    Schedule.find(params[:id]).destroy
    redirect_to action: "schedule_list"
  end

  def schedule_list
    @page_title = 'SIM'
    @all_schedule_list = Schedule.all
  end

  def initialize_sim
    @page_title = 'SIM'
    schedule = Schedule.find(params[:id])
    
    state = State.new
    
    state.set_event_calender([[1, 0.00, "Arr"],["-", 20.00, "End"]])
    state.set_IAT_arr(schedule.IAT.split(',').map(&:strip)).flatten.collect { |i| i.to_f }
    state.set_ST_arr(schedule.ST.split(',').map(&:strip)).flatten.collect { |i| i.to_f }
    state.set_ST_arr_bar([])
    state.set_queue([])
    
    @state = state
    $state = @state
  end

  def tick_sim
    @page_title = 'SIM'
    state = $state
    
    event_to_run = state.get_event_calender[0]
    state.set_last_tick(state.get_clock)
    state.set_clock(event_to_run[TIME])
    new_event_calender = state.get_event_calender
    new_event_calender.delete_at(0)
    time_interval = state.get_clock - state.get_last_tick
    
    if event_to_run[EVENT] == "Arr"
      if state.get_machine == 0
        state.set_Area_und_b_t(state.get_Area_und_b_t + time_interval*0)
        state.set_machine(Part.new(event_to_run[PART_NUM], state.get_clock))
        
        new_event_calender += [[state.get_ST_arr_bar.length + 1, state.get_clock+state.get_ST_arr[0].to_f, "Dep"]]
        state.set_ST_arr_bar(state.get_ST_arr_bar.push(state.get_ST_arr[0]))
        tmp_arr = state.get_ST_arr
        tmp_arr.delete_at(0)
        state.set_ST_arr(tmp_arr)
        state.set_NofCWTinQ(state.get_NofCWTinQ + 1)
      else
        state.set_Area_und_b_t(state.get_Area_und_b_t + time_interval*1)
        state.set_Area_und_q_t(state.get_Area_und_q_t + time_interval*state.get_queue.length)
        queue = state.get_queue
        queue += [Part.new(event_to_run[PART_NUM], state.get_clock)]
        state.set_queue(queue)
      end
      new_event_calender += [[state.get_IAT_arr_bar.length + 2, state.get_clock+state.get_IAT_arr[0].to_f, "Arr"]]
      
      state.set_IAT_arr_bar(state.get_IAT_arr_bar.push(state.get_IAT_arr[0]))
      tmp_arr = state.get_IAT_arr
      tmp_arr.delete_at(0)
      state.set_IAT_arr(tmp_arr)
      state.set_q_t(state.get_queue.length)
    
    elsif event_to_run[EVENT] == "Dep"
      state.set_Area_und_b_t(state.get_Area_und_b_t + time_interval*1)
      state.set_machine(0)
      state.add_completed
      
      state.set_b_t(0)
      if state.get_queue.length != 0
        state.set_Area_und_q_t(state.get_Area_und_q_t + time_interval*state.get_queue.length)
        new_queue = state.get_queue
        part_to_work = new_queue[0]
        new_queue.delete_at(0)
        state.set_queue(new_queue)
        
        waiting_time = state.get_clock - part_to_work.get_arrival_time
        state.set_TofWTinQ(state.get_TofWTinQ + waiting_time)
        if waiting_time > state.get_max_waiting_time
          state.set_max_waiting_time(waiting_time)
        end
        
        #작업 시작
        state.set_machine(part_to_work)
        
        new_event_calender += [[state.get_ST_arr_bar.length + 1, state.get_clock + state.get_ST_arr[0].to_f, "Dep"]]
        state.set_ST_arr_bar(state.get_ST_arr_bar.push(state.get_ST_arr[0]))
        tmp_arr = state.get_ST_arr
        tmp_arr.delete_at(0)
        state.set_ST_arr(tmp_arr)
        state.set_NofCWTinQ(state.get_NofCWTinQ + 1)
        
      else
        state.set_machine(0)
        
      end
    else
      # 시뮬레이션 끝일 때
      state.set_Area_und_q_t(state.get_Area_und_q_t + time_interval*state.get_queue.length)
      b_t = 0
      if state.get_machine != 0
        b_t = 1
      else
        b_t = 1
      end
      state.set_machine(state.get_machine)
      state.set_queue(state.get_queue)
      state.set_Area_und_b_t(state.get_Area_und_b_t + time_interval*b_t)
      
      state.set_terminate(true)
      $state = state
    end
    
    
    new_event_calender.sort_by! {|event| event[TIME]}
    state.set_event_calender(new_event_calender)
    
    @state = state
  end

  def result_show
    @page_title = 'SIM'
    @state = $state
  end
end
