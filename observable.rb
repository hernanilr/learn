# frozen_string_literal: true

# module Observable
module Observable
  STATE = {}.freeze

  def observers
    @observer_list ||= []
  end

  def add_observer(obj)
    observers << obj
  end

  def notify_observers
    observers.each(&:update)
  end

  module_function

  def state=(value)
    STATE[object_id] = value
  end

  def state
    STATE[object_id]
  end

  def states
    STATE
  end

  # @state = {}
  # def state=(value)
  #   @state[object_id] = value
  # end
  # def state
  #   @state[object_id]
  # end
  # def states
  #   @state ||= {}
  # end
end

# class TelescopeScheduler
class Telescope
  # other classes can register to get notifications
  # when the schedule changes
  include Observable
  def initialize
    @observer_list = []
  end

  # folks with telescope time
  def add_viewer(viewer)
    @observer_list << viewer
  end

  # ...
end

Observable.instance_method(:state).owner # => Observable
Observable.public_method_defined?(:state) # => false
Observable.private_method_defined?(:state) # => true

Observable.method(:state).owner # => #<Class:Observable>
Observable.method(:state).owner.singleton_class? # => true
