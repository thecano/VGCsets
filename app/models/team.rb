class Team < ActiveRecord::Base
belongs_to :player

attr_accessor :fecha, :formato #both
	
	def fecha
	 if !Top.where(:team1_id=>self.id).empty?
	 	self.fecha = Top.where(:team1_id=>self.id).first.fecha
	 elsif !Top.where(:team2_id=>self.id).empty?
	 	self.fecha = Top.where(:team2_id=>self.id).first.fecha
	 elsif !Top.where(:team3_id=>self.id).empty?
	 	self.fecha = Top.where(:team3_id=>self.id).first.fecha
	 elsif !Top.where(:team4_id=>self.id).empty?
	 	self.fecha = Top.where(:team4_id=>self.id).first.fecha
	 elsif !Top.where(:team5_id=>self.id).empty?
	 	self.fecha = Top.where(:team5_id=>self.id).first.fecha
	 elsif !Top.where(:team6_id=>self.id).empty?
	 	self.fecha = Top.where(:team6_id=>self.id).first.fecha
	 elsif !Top.where(:team7_id=>self.id).empty?
	 	self.fecha = Top.where(:team7_id=>self.id).first.fecha
	 elsif !Top.where(:team8_id=>self.id).empty?
	 	self.fecha = Top.where(:team8_id=>self.id).first.fecha
	 else
	 	self.fecha = DateTime.new(2000, Time.now.month, Time.now.day)
	 end
	end

	def formato
	 if !Top.where(:team1_id=>self.id).empty?
	 	self.formato = Top.where(:team1_id=>self.id).first.formato
	 elsif !Top.where(:team2_id=>self.id).empty?
	 	self.formato = Top.where(:team2_id=>self.id).first.formato
	 elsif !Top.where(:team3_id=>self.id).empty?
	 	self.formato = Top.where(:team3_id=>self.id).first.formato
	 elsif !Top.where(:team4_id=>self.id).empty?
	 	self.formato = Top.where(:team4_id=>self.id).first.formato
	 elsif !Top.where(:team5_id=>self.id).empty?
	 	self.formato = Top.where(:team5_id=>self.id).first.formato
	 elsif !Top.where(:team6_id=>self.id).empty?
	 	self.formato = Top.where(:team6_id=>self.id).first.formato
	 elsif !Top.where(:team7_id=>self.id).empty?
	 	self.formato = Top.where(:team7_id=>self.id).first.formato
	 elsif !Top.where(:team8_id=>self.id).empty?
	 	self.formato = Top.where(:team8_id=>self.id).first.formato
	 else
	 	self.fecha = 'VGC99'
	 end
	end


end
