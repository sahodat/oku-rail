Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root "index#index"

   get   'delay'      =>  'delay2#delay2'
   get   'delay_joban'      =>  'delay_joban#delay_joban'
   get   'delay2'    =>  'delay#delay'
end
