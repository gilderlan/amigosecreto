require 'bundler/setup'
Bundler.require

def encode(payload)
  secrect_key = 'amigo_secreto'
  JWT.encode(payload, 'amigo_secreto', 'HS256')
end

members = ['Gil', 'Melanie', 'Ivone', 'Nair', 'Meire', 'Ieda', 'Ingra', 'Pedro']
avaliable_mebers = members.clone
links = []

final_list = []

members.each do |owner|
  client = avaliable_mebers.sample
  # client = owner == 'Ivone' ? 'Gil' : avaliable_mebers.sample

  while owner == client do
    client = avaliable_mebers.sample
  end

  token = encode({owner: owner, client: client})
  url = "https://gilderlan.github.io/amigosecreto?token=#{token}"

  links.push("#{owner} - #{url}")

  final_list.push("#{owner} - #{client}")

  avaliable_mebers.delete(client)
end

puts links
# puts final_list
