Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root "index#index"

   get   'delay'      =>  'delay2#delay2'
   get   'delay201'      =>  'delay201#delay201'
   get   'delay202'      =>  'delay202#delay202'
   get   'delay203'      =>  'delay202#delay202'
   get   'delay204'      =>  'delay203#delay203'
   get   'delay205'      =>  'delay203#delay205'
   get   'delay2'    =>  'delay#delay'
end
