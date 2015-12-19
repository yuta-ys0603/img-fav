# coding: utf-8
class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :name, message: 'その名前は既に利用されています'
  validates_presence_of :name
  validates_presence_of :password_digest
  has_many :favorites
end
