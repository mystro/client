require "terminal-table"
module Mystro
  module CLI
    class << self
      def table(head, rows=nil)
        if rows
          t = Terminal::Table.new :headings => head, :rows => rows
        else
          t = Terminal::Table.new :rows => rows
        end
        t
      end

      def list(keys, list)
        rows = []
        list.each do |l|
          row = []
          keys.each do |k|
            row << (l[k] || l[k.downcase] || l[k.to_sym] || l[k.downcase.to_sym])
          end
          rows << row
        end
        table(keys, rows)
      end

      def show(obj)
        keys = obj.keys
        rows = []
        keys.each do |k|
          rows << [k, obj[k]]
        end
        table(%w{key value}, rows)
      end
    end
  end
end