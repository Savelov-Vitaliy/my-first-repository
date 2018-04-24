# control service methods
module ControlService
  def start
    loop do
      begin
        puts ''
        print 'Командуйте: '
        input = gets.chop
        input = input.split('.')
        break if input[0] == '0'
        if input[1].nil?
          send(input[0])
        else
          parametrs = input[1].split(',')
          if parametrs[1].nil?
            send(input[0], parametrs[0])
          else
            send(input[0], parametrs[0], parametrs[1])
          end
        end
      rescue StandardError => e
        puts "Ошибка: #{e.message}"
        retry
      end
    end
    puts 'Выход.'
    puts 'До свидания!'
  end

  def help
    puts 'Симулятор железной дороги © Savelov_Vitaliy 2018'
    puts ''
    puts 's : список всех станций'
    puts 'st.индекс станции : список всех поездов на станций'
    puts 'sa.название станции : создать новую станцию: '
    puts ''
    puts 'r : список всех марштуров'
    puts 'ra.индекс начальной станции, индекс конечной станции : создать марштрут'
    puts 'rsa.индекс марштрута, индекс станции : добавить в марштрут станцию'
    puts 'rsd.индекс марштрута, индекс станции : удалить станцию из марштрута'
    puts ''
    puts 't : список всех поездов'
    puts 'ta.номер поезда, тип (passanger|cargo) : создать поезд'
    puts 'tra.индекс поезда, индекс марштрута : поезду назаначить марштрут'
    puts 'tf.индекс поезда : переместить поезд вперед по маршруту'
    puts 'tb.индекс поезда : переместить поезд назад по маршруту'
    puts 'ts.поезд : посмотреть на какой станции находится поезд'
    puts 'tw.поезд : посмотреть сколько вагонов у поезда'
    puts 'twa.индекс поезда, объем вагона : прицепить вагон к поезду'
    puts 'twd.индекс поезда : отцепить вагон от поезда'
    puts 'tspu.поезд : увеличить скорость поезда'
    puts 'tstop.индекс поезда : остановить поезд'
    puts ''
    puts '0 : выход'
    puts 'help : список комманд'
    puts "seed : 'посев', тестовая железная дорога + тест"
    puts ''
    puts 'Пример ввода команд: s (ввод), sa.Москва (ввод), ta.101 Скорый'
  end

  def seed
    test_stations_and_routs
    test_trains
    test_wagons    
    ta('1 Скорый', 'passenger')
  end

  def test_stations_and_routs
    sa('Москва')
    sa('Магадан')
    sa('Екб')
    sa('Казань')
    sa('Новосиб')
    s
    ra(1, 4)
    ra(0, 3)
    ra(0, 2)
    rsa(1, 3)
    rsa(0, 0)
    rsa(0, 2)
    rsa(0, 3)
    rsd(0, 4)
    r
    rsd(0, 3)
    r(0)
  end

  def test_trains
    ta('101-Sk', 'passenger')
    ta('130-LS', 'passenger')
    ta('Hoods', 'passenger')
    ta('50001', 'cargo')
    ta('Lucky', 'cargo')
    t
    tra(0, 1)
    tra(1, 0)
    tra(2, 1)
    tra(4, 2)
    te
    tf(0)
    tf(4)
    tf(4)
    tf(1)
    tf(1)
    tf(1)
    tb(1)
    te
    stn(2)
  end

  def test_wagons
    twa(0, 100)
    twa(0, 50)
    twa(4, 5)
    twt(0, 0, 50)
    twt(0, 0, 5)
    twt(0, 1, 7)
    twt(4, 0, 5)
    tw(0)
    tw(1)
    tspu(0)
    tspu(1)
    tspu(1)
    tspu(4)
    twd(2)
    twd(4)
    tstop(4)
    twd(4)
  end
end
