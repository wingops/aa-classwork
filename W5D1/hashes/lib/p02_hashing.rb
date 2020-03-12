# class Integer
#   # Integer#hash already implemented for you
# end

# class Array
#   def hash
#     sum += self.length.hash
#     sum += self[0].hash
#   end
# end

# class String
#   def hash
#     ref = ('a'..'z').to_a
#     self.downcase.each_char do |char|
#       sum += ref.index(char).hash
#     end
#   end
# end

# class Hash
#   # This returns 0 because rspec will break if it returns nil
#   # Make sure to implement an actual Hash#hash method
#   def hash
#     self.values.each do |val|
#       sum += val.hash
#     end
#   end
# end


# # def my_hash(patient)
# #   sum = 0
# #   if patient.instance_of?(String)
# #     ref = ('a'..'z').to_a
# #     patient.downcase.each_char do |char|
# #       sum += ref.index(char).hash
# #     end
# #   elsif patient.instance_of?(Array)
# #     sum += patient.length.hash
# #     sum += my_hash(patient[0])
# #   elsif patient.instance_of?(Hash)
# #     patient.values.each do |val|
# #       sum += my_hash(val)
# #     end

# #   end
# #   sum
# # end