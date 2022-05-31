import React from 'react';

const Article = (props) => {
  const { article } = props;
  return (
    <div>
      <div>
        {article.title} ({article.author})
      </div>
    </div>
  );
};

export default Article;