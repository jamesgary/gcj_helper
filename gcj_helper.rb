require 'benchmark'
require 'jruby_threach'

class GCJ
  def self.solve(input, output, config = {})
    config = {
      show_progress: false,
      show_output: true,
      cores: 8,
    }.merge(config)

    test_case_count = 0
    first_line = true
    lines_hash = {}
    cases_hash = {}

    File.open(input, 'r').each_line do |line|
      if first_line
        first_line = false
      else
        test_case_count += 1
        lines_hash[test_case_count] = line
      end
    end

    Benchmark.bm do |x|
      x.report do
        done_count = 0.0
        lines_hash.threach(8) do |num, line|
          cases_hash[num] = "Case ##{ num }: #{ yield(line) }"
          done_count += 1
          puts "#{ (done_count * 100) / test_case_count }% done, just finished ##{ num }" if config[:show_progress]
        end
      end
    end

    i = 1
    File.open(output, 'w') do |out|
      while i <= test_case_count
        out.puts cases_hash[i]
        puts cases_hash[i] if config[:show_output]
        i += 1
      end
    end
  end
end
