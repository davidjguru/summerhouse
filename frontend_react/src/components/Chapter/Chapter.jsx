import React from 'react';

const Chapter = (props) => {
  const { chapter } = props;
  return (
    <div>
      <div>
        {chapter.title} ({chapter.author})
      </div>
    </div>
  );
};

export default Chapter;