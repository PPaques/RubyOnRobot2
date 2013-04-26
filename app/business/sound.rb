class Sound
  ##
  # This class contain all the sound related event.
  # depend on : +Espeak+ et +aplay+

  # play a sound;
  # +options :+
  #     +file+ : file to read (must be in public repository)
  def play options
    options[:filename] ||= "no.wav"

    filename = Rails.root.join('public', 'audio', options[:filename])
    system("aplay filename > /dev/null 2> /dev/null &")
  end

  def say options
    #default paramaters
    options[:speed] ||= "80"
    options[:lang]  ||= "en"
    options[:text]  ||= "Hello World"


    system("espeak -v #{options[:lang]} -s #{options[:speed]} \"#{options[:text]}\" > /dev/null 2> /dev/null &")
  end
end
