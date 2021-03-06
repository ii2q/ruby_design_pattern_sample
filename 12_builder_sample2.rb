# -*- coding: utf-8 -*-

# ConcreteBuilder：ビルダーの実装部分
# SaltWater： 塩水クラス
class SaltWater
  attr_accessor :water, :salt
  def initialize(water, salt)
    @water = water
    @salt = salt
  end

  # 塩を加える
  def add_material(salt_amount)
    @salt += salt_amount
  end
end

# ConcreteBuilder：ビルダーの実装部分
# SugarWater： 砂糖水クラス
class SugarWater
  attr_accessor :water, :sugar
  def initialize(water, sugar)
    @water = water
    @sugar = sugar
  end

  # 砂糖を加える
  def add_material(sugar_amount)
    @sugar += sugar_amount
  end
end

# Builder：
# SugarWaterBuilder： 加工水クラス
class WaterWithMaterialBuilder
  def initialize(class_name)
    @water_with_material = class_name.new(0,0)
  end

  # 調味料を入れる
  def add_material(material_amount)
    @water_with_material.add_material(material_amount)
  end

  # 水を加える
  def add_water(water_amount)
    @water_with_material.water += water_amount
  end

  # 加工水の状態を返す
  def result
    @water_with_material
  end
end

# Director： 加工水の作成過程を取り決める
class Director
  def initialize(builder)
    @builder = builder
  end
  def cook
    @builder.add_water(150)
    @builder.add_material(90)
    @builder.add_water(300)
    @builder.add_material(35)
  end
end

# ===========================================
builder = WaterWithMaterialBuilder.new(SugarWater)
director = Director.new(builder)
director.cook

p builder.result
# #<SugarWater:0x007fc773085bc8 @water=450, @sugar=125>

builder = WaterWithMaterialBuilder.new(SaltWater)
director = Director.new(builder)
director.cook

p builder.result
# #<SaltWater:0x007f92cc103ba8 @water=450, @salt=125>
