module ApplicationHelper
  def default_meta_tags
    {
      site: 'アイデアファーム supported by AIIT 中鉢PT',
      reverse: true,
      separator: '|',
      description: 'アイディアファームはアイディアとスキルをマッチングさせ、アイディアを実現させるサービスです。',
      keywords: 'アイデア, アイデアファーム, AIIT',
      canonical: request.original_url,
      noindex: !Rails.env.production?,
      og: {
        site_name: :site_name,
        title: :title,
        description: :description, 
        type: 'website',
        url: request.original_url,
        image: image_url("top_hands.jpg"),
        locale: 'ja_JP',
      },
      fb: {
        app_id: ENV['FACEBOOK_KEY']
      }
    }
  end
end
