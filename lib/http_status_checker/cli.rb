require 'pastel'
require 'tty-spinner'

module HttpStatusChecker
  class Cli
    def self.run(args)
      case args
      when '-v'
        puts "Http status checker #{HttpStatusChecker::VERSION}"
      when 'help'
        puts "In trouble, we'll help you"
      else
        perform_checks(args)
      end
    end

    def self.perform_checks(args)
      HttpStatusChecker.sites = args
      spinners = TTY::Spinner::Multi.new('[:spinner] status checks', format: :dots)
      sites_status = HttpStatusChecker.check do |site, response|
        spinner = spinners.register("[:spinner] #{site}", format: :dots)
        spinner.auto_spin
        response[:spinner] = spinner
      end
      show_results(sites_status)
    end

    def self.show_results(sites_status)
      pastel = Pastel.new
      sites_status.each do |site|
        site[:spinner].success(pastel.green(site[:status])) if ok? site[:status]
        site[:spinner].error(pastel.red(site[:status])) unless ok? site[:status]
      end
    end

    def self.ok?(status)
      status < 400 && status >= 200
    end
  end
end
