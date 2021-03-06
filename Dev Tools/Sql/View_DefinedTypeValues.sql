/* List DefinedTypeValues*/
SELECT c.Name as [Category]
    ,c.Guid as [Category.Guid]
    ,t.[Id] AS [DefinedType.Id]
    ,t.[Name] AS [DefinedType.Name]
    ,v.[Id] AS [DefinedValue.Id]
    ,v.[Guid] AS [DefinedValue.Guid]
    --,v.[Order] [DefinedValue.Order]
    ,v.[Value] AS [DefinedValue.Value]
    ,v.[Description] [DefinedValue.Description]
    ,cast((
            SELECT a.NAME
                ,av.Value
                ,a.Guid [Attribute.Guid]
                ,av.Guid [AttributeValue.Guid]
            FROM AttributeValue av
            JOIN Attribute a ON av.AttributeId = a.Id
            JOIN EntityType et ON a.EntityTypeId = et.Id
            WHERE et.NAME = 'Rock.Model.DefinedValue'
                AND av.EntityId = v.Id
            FOR XML PATH('Attribute')
                ,root('root')
            ) AS XML) [AttributeValues]
    ,t.Guid [DefinedType.Guid]
    ,v.Guid [DefinedValue.Guid]
FROM DefinedValue AS v
INNER JOIN DefinedType AS t ON t.Id = v.DefinedTypeId
inner join Category c on c.id = t.CategoryId
ORDER BY [c].[Name]
    ,[t].[Name]
    ,[v].[Order]
    ,[v].[Value]
